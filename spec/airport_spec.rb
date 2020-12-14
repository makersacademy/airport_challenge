require 'airport'

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

RSpec.describe Airport do 
    describe 'land' do 
      it 'accepts plane and puts it in a terminal' do
    #  Arrange - what should happen first, gather all object needed
      airport = Airport.new
      plane = ['BA30']
    # Act - what is the behaviour its given to run for my assertation to be true
      airport.land(plane)
    # Assert - what I expect my code to do
      expect(airport.terminal).to eq 'BA30'
        
    end
    end
  end
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    describe 'take off' do 
      let 'tells plane to take off and confirms departure' do
    # Arrange - what should happen first, gather all object needed
        airport = Airport.new
        plane = ['BA30']
        # Act - what is the behaviour its given to run for my assertation to be true
        airport.take_off(plane)
        # Assert - what I expect my code to do
        expect(airport.terminal).to should_not include? ('BA30')
        end
    end
    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when the airport is full 
        describe 'full airport' do
          let 'expects plane not to land when airport is full' do
            # Arrange - what should happen first, gather all object needed
            airport = Airport.new
            plane = ['BA31']
            # Act - what is the behaviour its given to run for my assertation to be true
            airport.full
            # Assert - what I expect my code to do
            expect(airport.terminal).to include? ("BA31")
            # be_full
            end
        end
        # As the system designer
        # So that the software can be used for many different airports
        # I would like a default airport capacity that can be overridden as appropriate
        describe 'airport' do
            let 'airport to be set to default capacity 20' do
            # it  'it can be overridden as appropriate' do end
            # Arrange - what should happen first, gather all object needed
            airport = Airport.new
            # Act - what is the behaviour its given to run for my assertation to be true
            DEFAULT_CAPACITY = 20
            # Assert - what I expect my code to do
            expect (airport.capacity).to be_set
            end
        end