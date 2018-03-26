require 'sequel'
require 'json'

require 'pry'

DB = Sequel.connect('sqlite://db-movies')

movies_table = DB[:movies] # initialize variable with empty table

def parse_json(file)
  json = File.open(file).read # open json image and store it into 'file'
  output = JSON.parse(json) # aaand pass 'file' to Json parser
end

movies = parse_json('movies_img.json')

movies_table.multi_insert(movies) # insert rows to table