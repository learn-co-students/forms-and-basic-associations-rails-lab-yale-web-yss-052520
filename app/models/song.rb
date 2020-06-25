class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(note_contents)
    note_contents.each do |note_content|
      if note_content.present?
        note = Note.new(content: note_content, song_id: self.id)
        self.notes << note
      end
    end
  end


end
