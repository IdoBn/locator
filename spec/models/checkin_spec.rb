require 'spec_helper'

describe Checkin do

	it 'reverse geocodes the address' do 
		Checkin.any_instance.unstub(:reverse_geocode)
		expect(create(:checkin).address).to eq('1 Liberty Island, New York, NY 10004, USA')
		Checkin.any_instance.stub(:reverse_geocode) { 'some address' }
	end

  it { expect { user1.checkins << statue_liberty }.to change { user1.checkins.count }.by(1) }

  it 'default scope DESC' do
  	Checkin.first.created_at.should > Checkin.last.created_at
  end

end
