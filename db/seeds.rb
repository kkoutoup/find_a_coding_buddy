# Dependencies
require 'csv'
require 'open-uri'

def image_fetcher
  URI.open("https://kitt.lewagon.com/placeholder/users/random")
end

# Destroy entries
puts "=> Destroying existing entries"
User.destroy_all if Rails.env.development?
Technology.destroy_all if Rails.env.development?
Project.destroy_all if Rails.env.development?
ProjectTechnology.destroy_all if Rails.env.development?
UserTechnology.destroy_all if Rails.env.development?

# Global variables for seeding
LEVEL = ["beginner", "intermediate", "advanced"]
EMAIL_EXTENSIONS = ["@gmail.com", "@yahoo.com", "@hotmail.com", "@business.com", "@aol.com"]
TECHNOLOGIES = ["Javascript", "Node.js", "Express.js", "MongoDB", "Python", "Flask", "Ruby", "Rails", "HTML", "SASS", "Figma", "PHP", "Design", "Android", "Goland", "SQL", "Django", "Vue.js", "React", "Bootstrap", "Sinatra", "API"]
CITIES = ["London", "Paris", "Milan", "Athens", "Copenhagen", "Madrid", "Barcelona", "Berlin", "Tokyo", "Amsterdam", "Lyon", "Grenoble", "Stockholm"]

# Populate csv with summaries
puts "=> Populating personal summaries from csv"

filepath = "profile_descriptions.csv"

csv_options = { headers: :first_row, force_quotes: true, quote_char: '"' }

CSV.foreach(filepath, csv_options) do |row|
  row = row.to_s.strip # remove \n from row

  user = User.new(
    {
      first_name: Faker::Name.first_name,
      last_name:  Faker::Name.last_name,
      personal_summary: row,
      address: CITIES.sample,
      expertise_level: LEVEL.sample,
      password: "testing"
    }
  )
  user.email = "#{ user.first_name }_#{ user.last_name }#{ EMAIL_EXTENSIONS.sample }"
  photo = image_fetcher
  user.photo.attach({
    io: photo,
    filename: "#{user.id}_faker_image.jpg"
  })
 user.save!
end

# puts "=> Updating user email addresses and passwords"
# User.all.each do |user|
#   user.email = "#{ user.first_name }_#{ user.last_name }#{ EMAIL_EXTENSIONS.sample }"
#   user.photo.attach({
#     io: image_fetcher,
#     filename: "#{user.id}_faker_image.jpg"
#  })
#   user.save!
# end

# Technologies
puts "=> Creating technologies"
TECHNOLOGIES.each do |technology|
  Technology.create!(
    {
      name: technology
    }
  )
end

# Projects
puts "=> Creating projects"

filepath = "project_descriptions.csv"
csv_options = { headers: :first_row, force_quotes: true, quote_char: '"' }

CSV.foreach(filepath, csv_options) do |row|
  project = Project.create!(
    {
      title: row[0],
      description: row[1],
      duration: row[2],
      difficulty: LEVEL.sample,
      user_id: User.all.sample.id
    }
    )
  Chatroom.create!(project_id: project.id)
end

# Project Technologies
puts "=> Creating project technologies"
Project.all.each do |project|
  title = project.title.split.uniq
  title.each do |word|
    if TECHNOLOGIES.include?word
      technology = Technology.find_by(name:"#{word}")
      ProjectTechnology.create!(
        {
          project_id: project.id,
          technology_id: technology.id
        }
      )
    end
  end
end

# User Technologies
puts "=> Creating user technologies"
User.all.each do |user|
  technologies = Technology.all.sample(3)
  technologies.each do |technology|
    UserTechnology.create!(
      {
        technology_id: technology.id,
        user_id: user.id
      }
    )
  end
end
