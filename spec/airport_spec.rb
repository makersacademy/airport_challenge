require 'airport'
require 'plane'

describe Airport do
  let(:airport) { described_class.new }
  it 'responds to receive_plane method' do
    expect(subject).to respond_to(:receive_plane).with(1).argument
  end

  it 'responds to request_take_off method' do
    expect(subject).to respond_to(:request_take_off)
  end

  it 'responds to check_weather method' do
    expect(subject).to respond_to(:check_weather)
  end

  it 'can accept 1 argument with initialize' do
    expect(Airport).to respond_to(:new).with(1).argument
  end

  describe '#receive_plane' do
    it 'allows airport to accept a plane and store it' do
      plane = Plane.new
      airport.receive_plane(plane)
      expect(airport.planes).to include(plane)
    end

    it 'accepts instances of Plane class' do
      plane = Plane.new
      airport.receive_plane(plane)
      expect(airport.planes[-1]).to be_instance_of Plane
    end

    it 'raises error when airport is full' do
      plane = Plane.new
      airport.capacity.times { airport.receive_plane(plane) }
      expect { airport.receive_plane(plane) }.to raise_error 'Airport full!'
    end
  end

  describe '#take_off' do
    it 'removes a plane from the airport' do
      plane = Plane.new
      airport.receive_plane(plane)
      expect(airport.request_take_off).to be_instance_of Plane
    end

    it 'raises error when no planes left in airport' do
      expect { airport.request_take_off }.to raise_error 'No planes left!'
    end
  end

  describe '#check_weather' do
    it 'produces a random weather type' do
      weather = ['sunny', 'stormy', 'cloudy', 'rainy', 'calm']
      expect(weather).to include(airport.check_weather)
    end
  end

end
