# ACT ASSERT ARRANGE

# User story 5 - Stormy no take off
# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# User story 6 - Stormy no landing
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

require 'Weather.rb' #classes required
require 'Airport.rb'

describe Airport do # only have to write once with 'its' underneath
  let( :airport ) { Airport.new } # this createa an Airport.new for each test so you don't have to write it our each time

    it 'stormy no take off' do
      expect { weather.stormy? == true }
    end

    it 'stormy no landing' do
      expect { weather.stormy? == true }
    end
end
