# Destroy entries
puts "Destroying existing entries"
User.destroy_all if Rails.env.development?
Technology.destroy_all if Rails.env.development?

# Global variables for seeding
LEVEL = ["beginner", "intermediate", "advanced"]
EMAIL_EXTENSIONS = ["@gmail.com", "@yahoo.com", "@hotmail.com", "@business.com", "@aol.com"]
PERSONAL_SUMMARIES = []
TECHNOLOGIES = ["Javascript", "Node.js", "express.js", "mongoDB", "Python", "Flask", "Ruby", "Ruby on Rails", "HTML", "CSS/SCSS", "Figma", "C#", ".NET", "PHP", "APIs", "Design", "Android", "Go", "SQL"]

# Populate csv with summaries
puts "=> Populating personal summaries from csv"
require 'csv'

filepath = "profile_descriptions.csv"

csv_options = { headers: :first_row, force_quotes: true, quote_char: '"' }

CSV.foreach(filepath, csv_options) do |row|
  row = row.to_s.strip # remove \n from row
  PERSONAL_SUMMARIES << row
end

# Users
puts "=> Creating users"
10.times do
  user = User.create!(
    {
      first_name: Faker::Name.first_name,
      last_name:  Faker::Name.last_name,
      email: Faker::Internet.email,
      personal_summary: PERSONAL_SUMMARIES.sample,
      expertise_level: LEVEL.sample,
      password: "testing"
    }
  )
end

puts "=> Updating user email addresses and passwords"
User.all.each do |user|
  user.email = "#{user.first_name}_#{user.last_name}#{EMAIL_EXTENSIONS.sample}"
  user.password = "#{Faker::Verb.past}#{Faker::Superhero.power}#{rand(1..200)}"
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

