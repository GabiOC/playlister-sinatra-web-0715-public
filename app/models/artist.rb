class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  extend Slugable
  add_slug_for :name
end
