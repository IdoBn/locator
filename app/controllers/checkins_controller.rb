class CheckinsController < ApplicationController
	def index
		@checkins = Checkins.all
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
			params.require(:checkin).permit(:address)
		end
end