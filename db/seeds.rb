# Dependencies
require 'csv'

# Destroy entries
puts "=> Destroying existing entries"
User.destroy_all if Rails.env.development?
Technology.destroy_all if Rails.env.development?
Project.destroy_all if Rails.env.development?
ProjectTechnology.destroy_all if Rails.env.development?

# Global variables for seeding
LEVEL = ["beginner", "intermediate", "advanced"]
EMAIL_EXTENSIONS = ["@gmail.com", "@yahoo.com", "@hotmail.com", "@business.com", "@aol.com"]
TECHNOLOGIES = ["Javascript", "Node.js", "Express.js", "MongoDB", "Python", "Flask", "Ruby", "Rails", "HTML", "SCSS", "Figma", "C#", ".NET", "PHP", "Design", "Android", "Go", "SQL", "Django", "Vue.js", "React", "Bootstrap", "CSS", "Sinatra", "Selenium", "API"]

# Populate csv with summaries
puts "=> Populating personal summaries from csv"

filepath = "profile_descriptions.csv"

csv_options = { headers: :first_row, force_quotes: true, quote_char: '"' }

CSV.foreach(filepath, csv_options) do |row|
  row = row.to_s.strip # remove \n from row

  User.create!(
    {
      first_name: Faker::Name.first_name,
      last_name:  Faker::Name.last_name,
      email: Faker::Internet.email,
      personal_summary: row,
      expertise_level: LEVEL.sample,
      password: "testing"
    }
  )
end

# puts "=> Updating user email addresses and passwords"
User.all.each do |user|
  user.email = "#{ user.first_name }_#{ user.last_name }#{ EMAIL_EXTENSIONS.sample }"
  user.password = "#{ Faker::Verb.past }#{ Faker::Superhero.power }#{ rand(1..200) }"
  user.save!
end

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
  Project.create!(
    {
      title: row[0],
      description: row[1],
      duration: row[2],
      difficulty: LEVEL.sample,
      user_id: User.all.sample.id
    }
  )
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
