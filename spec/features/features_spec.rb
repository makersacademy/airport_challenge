describe "Features" do
  let(:heathrow) { Airport.new(50, weather) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context 'when the weather is not stormy' do
    before(:each) do 
      allow(weather).to receive(:stormy?).and_return(false)
    end

  # User Story
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
    it 'instructs a plane to land so passengers get to a destination' do
      expect { heathrow.land(plane) }.not_to raise_error
    end

# User Story - Edge Case 
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'instructs a plane to take off so passengers get to a destination' do
      heathrow.land(plane) 
      expect { heathrow.take_off(plane) }.not_to raise_error
    end

# User Story - Edge Case 
# As a system designer
# So I can ensure system consistency 
# I do not want to allow flying planes to take off and/or be in an airport
    it 'cannot take off flying planes' do
      expect { plane.take_off }.to raise_error('The plane is already in the sky.')
    end 

    it 'cannot have flying planes in the airport' do
      expect { plane.airport }.to raise_error('The plane is not at the airport.')
    end 

# User Story
# As an air traffic controller 
# To ensure consistency 
# I want to ensure that planes can only take off from airports they are in
    it 'takes off planes only from the airports they are in' do
      gatwick = Airport.new(30, weather)
      gatwick.land(plane)
      expect { heathrow.take_off(plane) }.to raise_error('Cannot take off the plane - the plane is in another airport.')
    end

# User Story
# As an air traffic controller 
# To ensure consistency 
# I want to ensure that planes that take off are no longer in the airport 
    it 'removes plane from the airport once it takes off' do
      heathrow.land(plane)
      heathrow.take_off(plane)
      expect(heathrow.landed_planes).to_not include(plane)
    end 

# User Story
# As an air traffic controller 
# To ensure consistency 
# I want to ensure that not-flying planes cannot land and must be in the airport

    it 'cannot land landed planes again' do
      plane.land(heathrow)
      expect { plane.land(heathrow) }.to raise_error('Landed planes cannot land again.')
    end 

    it 'should have non-flying/landed planes in the airport' do
      plane.land(heathrow)
      expect(plane.airport).to eq(heathrow)
    end 
# User Story 
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 
    context 'when the airport is full' do

      it 'does not allow plane to land to ensure safety' do
        50.times do  
          new_plane = Plane.new
          heathrow.land(new_plane) 
        end
        expect { heathrow.land(plane) }.to raise_error('The airport is full.')
      end
    end

  # User_story 
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
    it 'has a default capacity that can be overridden' do
      random_number = Random.rand(10..100)
      airport = double(:airport, capacity: random_number, weather: false)
      expect { airport.capacity }.not_to raise_error
    end
  end

# User Story 
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

  context 'when the weather is stormy' do
    before do 
      allow(weather).to receive(:stormy?).and_return(true)
    end

    it 'does not allow plane to land to ensure safety' do
      expect { heathrow.land(plane) }.to raise_error('Cannot land - it is stormy.')
    end

# User Story 
# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy

    it 'does not allow plane to take off to ensure safety' do
      expect { heathrow.take_off(plane) }.to raise_error('Cannot take off - it is stormy.')
    end
  end
end
