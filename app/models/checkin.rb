class Checkin < ActiveRecord::Base
	belongs_to :user

	default_scope { order('created_at DESC') } 

	reverse_geocoded_by :latitude, :longitude do |obj, results|
		obj.address = results.first.formatted_address
	end
	after_validation :reverse_geocode
end


# checkins.create(latitude: 40.6891988, longitude: -74.0445167)