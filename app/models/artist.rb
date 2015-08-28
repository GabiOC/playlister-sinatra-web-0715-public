class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
=begin
  Extend vs. include:
  - Extend makes the module or methods available to the class itself
  - Include makes it available to instances of the class.
=end
  extend Slugable
  add_slug_for :name
end
