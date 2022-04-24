require 'airport'
require 'weather'

describe Airport do

  describe '#land' do

    it 'instructs a plane to land at an airport' do

      # User story 1
      # As an air traffic controller 
      # So I can get passengers to a destination 
      # I want to instruct a plane to land at an airport

      # Arrange
      airport = Airport.new
      plane = Plane.new
      # Act / Assert
      expect { airport.land(plane) }.not_to raise_error
    end

    it 'prevents a plane from landing when airport is full' do

      # User story 3
      # As an air traffic controller 
      # To ensure safety 
      # I want to prevent landing when the airport is full 

      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport full'
    end

    it 'does not allow planes to land with stormy weather' do

      # User story 6
      # As an air traffic controller
      # To ensure safety
      # I want to prevent landing when weather is stormy 

      # Arrange
      airport = Airport.new
      stormy_weather = Weather.new
      plane = Plane.new

      # Act / Assert

      allow(stormy_weather).to receive(:stormy?) { true }
      allow(airport).to receive(:weather) { stormy_weather }
      
      expect{ airport.land(plane) }.to raise_error "Flight cannot land due to stormy weather"
    end

  end

  describe '#take_off' do

     it 'instructs a plane to take off and report it is not in the airport' do
      
      # User Story 2
      # As an air traffic controller 
      # So I can get passengers on the way to their destination 
      # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

      # Arrange
      airport = Airport.new
      plane = Plane.new

      # Act / Assert
     expect(subject.take_off).to eq 'Plane no longer in airport'
    end

    it 'prevents take off when weather is stormy' do

      # User story 5
      # As an air traffic controller 
      # To ensure safety 
      # I want to prevent takeoff when weather is stormy 

      # Arrange
      airport = Airport.new
      stormy_weather = Weather.new
      plane = Plane.new

      # Act / Assert

      allow(stormy_weather).to receive(:stormy?) { true }
      allow(airport).to receive(:weather) { stormy_weather }
      
      expect { airport.take_off(plane) }.to raise_error "Flight cancelled due to bad weather"
    end

  end

  it 'has a default airport capacity that can be overidden' do

    # User story 4
    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate

    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'Airport full'
    end
  end
end
