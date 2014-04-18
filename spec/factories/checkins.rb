# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :checkin do
    latitude 40.6891988
    longitude -74.0445167
    # address '1 Liberty Island, New York, NY 10004, USA'

    factory :marian_platz do
    	latitude 48.137048000000000000
    	longitude 11.575385999999980000
        # address 'München Marienplatz, 80331 Munich, Germany'
    end

    factory :close_to_marian_platz do
    	latitude 48.1378
    	longitude 11.5757
        # address 'Marienplatz 8, 80331 Munich, Germany'
    end
  end
end
