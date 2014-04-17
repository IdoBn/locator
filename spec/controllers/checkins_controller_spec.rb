require 'spec_helper'

describe CheckinsController do
	let(:valid_attributes) { FactorGirl.attributes_for(:checkin) }
	let(:user1) { create(:user1) }
  let(:user2) { create(:user2) }
  let(:user3) { create(:user3) }

  let(:statue_liberty) { create(:checkin) }
  let(:marian_platz) { create(:marian_platz) }
  let(:close_to_marian_platz) { create(:close_to_marian_platz) }

	
	context 'GET #index' do
		before :each do
  		user1.checkins << statue_liberty
		  user1.checkins << marian_platz
		  user2.checkins << close_to_marian_platz
		  user2.checkins << statue_liberty
		  user3.checkins << close_to_marian_platz
  	end

		it 'assigns @checkins' do
			get :index
			expect(assigns(:checkins)).to eq([marian_platz, statue_liberty, close_to_marian_platz])
		end

		it 'assigns @hash' do
			hash = [{:lat=>48.137048, :lng=>11.575386, :infowindow=>"Sandra Amhbfhjcjbah Fallerman"}, {:lat=>40.6891988, :lng=>-74.0445167, :infowindow=>"Betty Amhaehabcfeh Zamorewitz\t"}, {:lat=>48.1378, :lng=>11.5757, :infowindow=>"Bob Amhadgefdefa Riceescu"}]

			get :index
			expect(assigns(:hash)).to eq(hash)
		end
	end
end