class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end   

  def artist_name 
    # check if it is nil
    self.artist ? self.artist.name : nil 
  end 

  def notes=(notes)
    notes.reject(&:empty?).each do |note|
      note = Note.find_or_create_by(content: note) 
      self.notes << note 
    end 
  end 
end
