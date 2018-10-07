require 'pry'

class Song
  attr_accessor :name, :artist_name # this provides read/write for name/song
  @@all = []

  def self.all
    @@all
  end

  def save
    # @@all << self
    Song.all << self
    # self.class.all << self
  end


  def self.create
    song = self.new # can do Song.new
    song.save
    song
  end

  def self.new_by_name(song_n)
    song = self.new # song = self.create
    song.name = song_n
    song.save
    song
  end

  def self.create_by_name(song_n)
    song = self.create ## no need to push to all, as create saves song to all
    song.name = song_n
    song
  end

  def self.find_by_name(name)

    @@all.find {|song_instance| song_instance.name == name ? song_instance : false }
    # @@all.find do |song_instances|
    #   if song_instances.name == name
    #     song_instances
    #   end
    #
    #  end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) # implied false
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song_instance| song_instance.name} # must be used with block
  end

  def self.destroy_all
    self.all.clear
  end



  def self.new_from_filename(name)
    name = name.chomp(".mp3")
    split_name = name.split(" - ")
    song = self.new
    song.artist_name = split_name[0]
    song.name = split_name[1]
    song
  end

  def self.create_from_filename(song)
    song = song.chomp(".mp3")
    split_song = song.split(" - ")

    new_song = self.create_by_name(split_song[1])
    new_song.artist_name = split_song[0]
    new_song
  end


  #   Song.find_by_name(name) == nil ? Song.create_by_name(name) : Song.find_by_name(name)
  # end
end # end of class
