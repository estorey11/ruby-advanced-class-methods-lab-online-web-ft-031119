require 'pry'

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
    song= self.new 
    @@all << song 
    song
  end
  
  def self.new_by_name(name)
    song= self.new 
    song.name=name
    song
  end
  
  def self.create_by_name(name)
    song= self.new
    song.name=name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name==name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name)||self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(file)
    song= self.new 
    split_file=file.split(" - ")
    song.artist_name=split_file[0]
    song.name=split_file[1].chomp(".mp3")
    song
  end
  
  def self.create_from_filename(file)
    song=self.new_from_filename(file)
    @@all << song 
    song
  end
  
  def self.destroy_all
    @@all=[]
  end

end
