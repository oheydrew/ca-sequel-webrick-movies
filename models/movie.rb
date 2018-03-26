require 'sequel'
require 'pry'

DB = Sequel.connect('sqlite://db/db-movies')

class Movie < Sequel::Model

end
