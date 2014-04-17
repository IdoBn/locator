class Checkin < ActiveRecord::Base
	belongs_to :user

	reverse_geocoded_by :latitude, :longitude, address: :location
	after_validation :reverse_geocode, :if => :address_changed?
end
