class CheckinsController < ApplicationController
	before_action :authenticate_user!, only: [:create]

	def index
		@checkins = User.last_checkins
		@hash = Gmaps4rails.build_markers(@checkins) do |checkin, marker|
			marker.lat checkin.latitude
		  marker.lng checkin.longitude
		  marker.infowindow checkin.user.name
		  # marker.picture({
		  # 	"url" => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
    #     "width" =>  36,
    #     "height" => 36 })
		  marker.json({title: checkin.user.name})
		end

		respond_to do |format|
		  	format.html
		  	format.json { render json: @checkins }
		end
	end

	def create
		@checkin = current_user.checkins.create(checkin_params)

		respond_to do |format|
			if @checkin.save
				format.html { redirect_to checkins_path, notice: 'checked in!' }
			else
				format.html { render action: 'index', notice: 'could not check in' }
			end
		end
	end

	private
		def checkin_params
			params.require(:checkin).permit(:longitude, :latitude)
		end
end