require 'spec_helper'

describe Checkin do
  let(:user1) { create(:user1) }
  let(:user2) { create(:user2) }
  let(:user3) { create(:user3) }

  let(:statue_liberty) { create(:checkin) }
  let(:marian_platz) { create(:marian_platz) }
  let(:close_to_marian_platz) { create(:close_to_marian_platz) }

 
  it { statue_liberty.address.should eq('1 Liberty Island, New York, NY 10004, USA') }

  it { expect { user1.checkins << statue_liberty }.to change { user1.checkins.count }.by(1) }
end
