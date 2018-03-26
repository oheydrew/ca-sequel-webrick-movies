require 'sequel'

DB = Sequel.connect('sqlite://db-movies')

puts 'Database table users created:'

DB.create_table :movies do
        primary_key :id
        String :cover_url
        String :description
        Float :rating
        String :title
end