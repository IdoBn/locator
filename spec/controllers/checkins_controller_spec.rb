require 'spec_helper'

describe CheckinsController do
	let(:valid_attributes) { FactoryGirl.attributes_for(:checkin) }
	
	context 'GET #index' do
		before :each do
  		user1.checkins << statue_liberty
		  user1.checkins << marian_platz
		  user2.checkins << close_to_marian_platz
		  user2.checkins << statue_liberty
		  user3.checkins << close_to_marian_platz

		  get :index
  	end

		it { expect(assigns(:checkins)).to eq([marian_platz, statue_liberty, close_to_marian_platz]) }

		it 'assigns @hash' do
			hash = [{:lat=>48.137048, :lng=>11.575386, :infowindow=>"Sandra Amhbfhjcjbah Fallerman"}, {:lat=>40.6891988, :lng=>-74.0445167, :infowindow=>"Betty Amhaehabcfeh Zamorewitz\t"}, {:lat=>48.1378, :lng=>11.5757, :infowindow=>"Bob Amhadgefdefa Riceescu"}]
			expect(assigns(:hash)).to eq(hash)
		end

		it { response.should render_template :index }
	end

	context 'POST #create' do
		before :each do
			ApplicationController.any_instance.stub(:current_user).and_return(User.first)
		end

		describe 'with valid attributes' do
			it 'creates a new checkin' do
				expect {
					post :create, checkin: valid_attributes
				}.to change { Checkin.count }.by(1)
			end

			it 'redirects to :index' do
				post :create, checkin: valid_attributes
				response.should redirect_to checkins_path
			end
		end

		describe 'with invalid attributes' do
			before :each do
				Checkin.any_instance.stub(:valid?).and_return(false)
			end

			it 'does not create checkin' do
				expect {
					post :create, checkin: valid_attributes
				}.to_not change { Checkin.count }
			end

			it 're-renders index' do
				post :create, checkin: valid_attributes
				response.should render_template :index
			end
		end
	end
end