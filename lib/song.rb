require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song=Song.new
    song.save
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name= song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|song|song.name == song_name}
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name =song_name
    song
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song|song.name}
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ").join(".").split(".")
    puts parts
    artist_name = parts[0]
    puts artist_name
    song_name = parts[1]
    puts song_name
    extension = parts[2]
    puts extension

    song= self.new
    song.name=song_name
    song.artist_name=artist_name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ").join(".").split(".")
    puts parts
    artist_name = parts[0]
    puts artist_name
    song_name = parts[1]
    puts song_name
    extension = parts[2]
    puts extension

    song= self.create
    song.name=song_name
    song.artist_name=artist_name
    song
  end

  def save
    self.class.all << self
  end

end
