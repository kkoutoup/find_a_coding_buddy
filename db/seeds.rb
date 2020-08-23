# Destroy entries
puts "Destroying existing entries"
User.destroy_all if Rails.env.development?

# Global variables for seeding
EXPERTISE_LEVEL = ["beginner", "intermediate", "advanced"]
EMAIL_EXTENSIONS = ["@gmail.com", "@yahoo.com", "@hotmail.com", "@business.com", "@aol.com"]
PERSONAL_SUMMARIES = []

# Populate csv with summaries
puts "=>Populating personal summaries from csv"
require 'csv'

filepath = "profile_descriptions.csv"

csv_options = { headers: :first_row, force_quotes: true, quote_char: '"' }

CSV.foreach(filepath, csv_options) do |row|
  row = row.to_s.strip # remove \n from row
  PERSONAL_SUMMARIES << row
end

# Users
puts "=>Creating users"
10.times do
  user = User.create!(
    {
      first_name: Faker::Name.first_name,
      last_name:  Faker::Name.last_name,
      email: Faker::Internet.email,
      personal_summary: PERSONAL_SUMMARIES.sample,
      expertise_level: EXPERTISE_LEVEL.sample,
      password: "testing"
    }
  )
  puts "Created user #{user.id}"
end

puts "=>Updating user email addresses"
User.all.each do |user|
  user.email = "#{user.first_name}_#{user.last_name}#{EMAIL_EXTENSIONS.sample}"
  user.save!
end
