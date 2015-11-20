class Track < ActiveRecord::Base
	validates :name, :bonus_track, :album_id, :lyrics, presence: true
	belongs_to :album
	has_one :band, through: :album, source: :band
end
