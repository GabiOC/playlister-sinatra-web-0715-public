class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def name=(new_name)
    super
    update_slug
  end

  private
  def update_slug
    self.slug = self.name.downcase.scan(/\w+/).join('-')
  end
end
