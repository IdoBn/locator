module Locator
  module GlobalHelpers
    def self.included(base)
      base.let(:user1) { create(:user1) }
      base.let(:user2) { create(:user2) }
      base.let(:user3) { create(:user3) }

      base.let(:statue_liberty) { create(:checkin) }
      base.let(:marian_platz) { create(:marian_platz) }
      base.let(:close_to_marian_platz) { create(:close_to_marian_platz) }
    end
  end  
end