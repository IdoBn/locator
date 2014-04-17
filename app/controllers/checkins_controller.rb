class CheckinsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		@checkins = User.last_checkins
		@hash = Gmaps4rails.build_markers(@checkins) do |checkin, marker|
			marker.lat checkin.latitude
		  marker.lng checkin.longitude
		  marker.infowindow checkin.user.name
		end
	end

	def new
		@checkin = Checkin.new
	end

	def create
		@checkin = current_user.checkins.create(checkin_params)

		respond_to do |format|
			if @checkin.save
				format.html { redirect_to checkins_path, notice: 'checked in!' }
			else
				format.html { render action: 'new' }
			end
		end
	end

	private
		def checkin_params
			params.require(:checkin).permit(:longitude, :latitude)
		end

		def authenticate_user!
			unless current_user
				redirect_to checkins_path, notice: 'please log in'
			end
		end
end