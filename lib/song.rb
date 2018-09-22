require"pry"

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

  def self.new_by_name(song_name)
    created_song = Song.create
    created_song.name = song_name
    created_song.save
    created_song
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name)
  end


  def self.find_by_name(namie)
    @@all.find {|instance| instance.name == namie}
  end

def self.find_or_create_by_name(song_name)
  found = self.find_by_name(song_name)
  if found==nil
    self.create_by_name(song_name)
  else
    found
  end
end

def self.alphabetical
  @@all.uniq.sort_by {|instance| instance.name}
end

def self.new_from_filename(filename)
  new_file=filename.split( " - ").join('.').split('.')
  got_name=new_file[1]
  got_artist=new_file[0]
  song_name=Song.new_by_name(got_name)
  song_name.artist_name=got_artist
  song_name.name=got_name #for some reason needs to be set manually as it sets it to "h" in previous call
#  binding.pry
  song_name
end

def self.create_from_filename(filename)
  self.new_from_filename(filename)
end

def self.destroy_all
  @@all=[]
end


end
