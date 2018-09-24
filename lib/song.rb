class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    # Song.all << self
    # @@all << self
  end


  def self.create
    song = self.new
    #@@all << song
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.find_by_name(name)
    # @@all.find { |song| song.name == name }
    @@all.find { |song| song.name == name ? song : false }
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    # song.save
    song
  end

  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name)
  #     self.find_by_name(name)
  #   else
  #     self.create_by_name(name)
  #   end
  # end

  # find_by_name(name) || create_by_name(name)

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create_by_name(name): self.find_by_name(name)
  end

  # def self.alphabetical
  #   self.all.sort_by {|song_list| song_list.name}
  # end
  def self.alphabetical
    self.all.sort_by {|song_instance| song_instance.name} # must be used with block
  end

  def self.new_from_filename(name)
    name = name.chomp(".mp3")
    split_name = name.split(" - ")
    song = self.new
    song.artist_name = split_name[0]
    song.name = split_name[1]
    song
  end

  def self.create_from_filename(name)
    name = name.chomp(".mp3")
    split_name = name.split(" - ")
    song = self.create_by_name(split_name[1]) #assigns song name on creation
    song.artist_name = split_name[0]
    song
  end



  def self.destroy_all
    @@all = []
    # @@all.clear
  end

end
