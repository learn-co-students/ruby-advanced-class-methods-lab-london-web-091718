class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    new_song = Song.new
    new_song.name = file.split(' - ')[-1].split('.')[0]
    new_song.artist_name = file.split(' - ')[0]
    new_song
  end

  def self.create_from_filename(file)
    new_song = Song.new
    new_song.name = file.split(' - ')[-1].split('.')[0]
    new_song.artist_name = file.split(' - ')[0]
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
