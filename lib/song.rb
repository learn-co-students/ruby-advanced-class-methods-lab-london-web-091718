class Song
  attr_accessor :name, :artist_name, :filename
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      puts song.name
    song.name == name
  end
end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.create_by_name(name)
  end
end

  def self.alphabetical
    @@all.sort do |song_a, song_b|
      song_a.name <=> song_b.name
  end
  # self.alphabetical
end

  def self.new_from_filename(filename)
     song = self.new
     song.name = filename.split(/ - /)[1][0..-5]
     song.artist_name = filename.split(/ - /)[0]
     song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
