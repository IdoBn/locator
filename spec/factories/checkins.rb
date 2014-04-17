# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :checkin do
    latitude 40.6891988
    longitude -74.0445167

    factory :marian_platz do
    	latitude 48.137048000000000000
    	longitude 11.575385999999980000
    end

    factory :close_to_marian_platz do
    	latitude 48.1378
    	longitude 11.5757
    end
  end
end
