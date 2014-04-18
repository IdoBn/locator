require 'spec_helper'

describe CheckinsController do
	let(:valid_attributes) { FactorGirl.attributes_for(:checkin) }
	
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
end