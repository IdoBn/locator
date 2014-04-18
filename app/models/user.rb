class User < ActiveRecord::Base
	has_many :checkins

	def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at) #unless auth.credentials.expires_at.blank?
	    user.save!
  	end
	end

	def last_checkin
		self.checkins.order('created_at DESC').first
	end

	def self.last_checkins
		users = []
		User.all.each do |user|
			users << user.last_checkin
		end
		return users.compact
	end
end
