# User Story 1:
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# Translation:
# Airport class
# With a method that allows me to land planes there -> clear_for_landing(plane)
# It should store the planes somewhere -> array called hangar 

# User Story 2:
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# Translation:
# Planes taking off
# A new method for airport -> clear_for_takeoff(plane)
# It should remove it from the hangar

# User Story 3:
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

# Translation:
# Hangar full
# New method -> max_capacity(plane)
# Should not allow plane to be added to hangar array

# User Story 4:
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# Translation:
# Hangar has a default max capacity that can be changed
# max_capacity(cap_number = 4) where 4 would be the default max

# User Story 5:
# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# Translation:
# Takeoff disabled when stormy -> Method: disabled

# User Story 6:
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

# Translation:
# Landing disabled when stormy -> Method: disabled

require "airport.rb"

RSpec.describe Airport do

  let(:airport) { Airport.new }

  describe '#clear_for_landing' do
    it 'takes a plane and adds it to the hangar' do
      airport.clear_for_landing("BA123")
      expect(airport.hangar).to include "BA123"
    end
  end

  describe 'clear_for_takeoff' do
    before(:each) do
      airport.clear_for_landing("BA123")
    end
    it 'removes a plane from the hangar' do
      airport.clear_for_takeoff("BA123")
      expect(airport.hangar).to_not include("BA123")
    end
    it 'returns flight number of the plane that just took off' do
      actual = airport.clear_for_takeoff("BA123")
      expect(actual).to eq("BA123")
    end
  end

  describe 'max_capacity' do
    it 'will not allow over 4 planes' do
      airport.clear_for_landing("BA123")
      airport.clear_for_landing("NB543")
      airport.clear_for_landing("GZ765")
      airport.clear_for_landing("HY890")
      airport.clear_for_landing("SF267")
      max_hangar = airport.max_capacity
      expect(max_hangar).to_not include("SF267")
    end
    it 'will allow an override for over 4 planes' do
      airport.clear_for_landing("BA123")
      airport.clear_for_landing("NB543")
      airport.clear_for_landing("GZ765")
      airport.clear_for_landing("HY890")
      airport.clear_for_landing("SF267")
      max_hangar = airport.max_capacity(5)
      expect(max_hangar).to include("SF267")
    end
  end

  describe 'disabled clear_for_landing' do
    it 'disallows takeoff in storm (2)' do
      airport.clear_for_landing("BA123", 2)
      expect(airport.hangar).to eq([])
    end
  end 

  describe 'disabled clear_for_takeoff' do
    it 'disallows takeoff in storm (2)' do
      airport.clear_for_landing("BA123")
      airport.clear_for_takeoff("BA123", 2)
      expect(airport.hangar).to eq(["BA123"])
    end
  end
end
