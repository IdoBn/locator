require 'spec_helper'

describe Checkin do
  let(:user1) { create(:user1) }
  let(:user2) { create(:user2) }
  let(:user3) { create(:user3) }

  let(:statue_liberty) { create(:checkin) }
  let(:marian_platz) { create(:marian_platz) }
  let(:close_to_marian_platz) { create(:close_to_marian_platz) }

  it 'has many checkins' do
  	expect {
  		user1.checkins << statue_liberty
  	}.to change { user1.checkins.count }.by(1)
  end

  context 'shows lates checkin' do
  	before :each do
  		user1.checkins << statue_liberty
		  user1.checkins << marian_platz
  	end
  	
	  it { user1.last_checkin.should eq(marian_platz) }
	end


end
