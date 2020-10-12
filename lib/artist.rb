class Artist

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def genres
    songs.map { |song| song.genre }
  end

  def new_song(name, genre)
    song = Song.new(name, self, genre)
    Song.all << song
    song
  end

end