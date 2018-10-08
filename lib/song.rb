class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(song_n)
    song = self.new
    song.name = song_n
    song.save
    song
  end

  def self.create_by_name(song_n)
    song = self.create
    song.name = song_n
    song
  end

  def self.find_by_name(name)
    @@all.find {|songs| songs.name == name ? songs : false}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)

    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    #   self.create_by_name(name)
    # end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    filename = filename.chomp(".mp3")
    split_filename = filename.split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    filename = filename.chomp(".mp3")
    split_filename = filename.split(" - ")
    song = self.create_by_name(split_filename[1])
    song.artist_name = split_filename[0]
    song
  end
end
