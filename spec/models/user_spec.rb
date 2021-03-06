require 'spec_helper'

describe User do

  it 'has many checkins' do
  	expect {
  		user1.checkins << statue_liberty
  	}.to change { user1.checkins.count }.by(1)
  end

  context 'shows lates checkin' do
  	before :each do
  		user1.checkins << statue_liberty
		  user1.checkins << marian_platz
		  user2.checkins << close_to_marian_platz
		  user2.checkins << statue_liberty
		  user3.checkins << close_to_marian_platz
  	end

	  it { user1.last_checkin.should eq(marian_platz) }

	  it 'for all users' do
	  	User.last_checkins.should eq([marian_platz, statue_liberty, close_to_marian_platz])
	  end
	end

end
