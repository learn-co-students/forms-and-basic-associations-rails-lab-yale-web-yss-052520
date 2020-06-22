class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre 

  has_many :notes 
  # add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name 
    self.artist ? self.artist.name : nil 
  end 

  def notes=(array)
    array.each do |note| 
      if note != "" 
        newnote = Note.create(content: note) 
        self.notes << newnote 
        self.save 
      end 
    end 
  end 
  
end
