require 'pry'
class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    # || @@all << song || Song.all << self
    # Here we use 'self' and 'class' so that if we ever change
    # the name of the @@ variable or class, we don't need to
    # change our code throughout as self + class will still work.
  end

  def self.create
    song = self.new
    song.save # || @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
    # This method won't save the song. Would req song.save
  end

  def self.create_by_name(song_name)
    song = self.create
    # same code, but references 'create' method above
    song.name = song_name
    song
  end

  def self.find_by_name(name)
    @@all.find {|songs| songs.name == name ? songs : false}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) == nil ? create_by_name(name) : find_by_name(name)
    # find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|songs| songs.name}
  end

  def self.new_from_filename(song)
    song = song.chomp(".mp3")
    split_song = song.split(" - ")

    new_song = self.create
    new_song.artist_name = split_song[0]
    new_song.name = split_song[1]
    new_song
  end

  def self.create_from_filename(song)
    song = song.chomp(".mp3")
    split_song = song.split(" - ")

    new_song = self.create_by_name(split_song[1])
    new_song.artist_name = split_song[0]
    new_song
  end

  def self.destroy_all
    self.all.clear
    # @@all.clear
  end

end # of class
