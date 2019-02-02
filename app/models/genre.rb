class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.distinct.count
  end

  def artist_count
    Genre.joins(:artist).distinct.count
  end

  def all_artist_names
    Genre.joins(:artist).distinct
  end
end
