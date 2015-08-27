class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def name=(new_name)
    super
    update_slug
  end

  private
  def update_slug
    self.slug = self.name.downcase.scan(/\w+/).join('-')
  end
end
