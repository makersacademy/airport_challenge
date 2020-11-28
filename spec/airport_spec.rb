require 'airport'
require 'plane'

describe Airport do
  let(:airport) { described_class.new }
  it 'responds to receive_plane method' do
    expect(subject).to respond_to(:receive_plane).with(1).argument
  end

  it 'responds to request_take_off method' do
    expect(subject).to respond_to(:request_take_off).with(1).argument
  end

  it 'responds to check_stormy method' do
    expect(subject).to respond_to(:check_stormy)
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

  describe '#request_take_off' do
    it 'removes a plane from the airport' do
      plane = Plane.new
      airport.receive_plane(plane)
      expect(airport.request_take_off(plane)).to be_instance_of Plane
    end

    it 'raises error when no planes left in airport' do
      plane = Plane.new
      expect { airport.request_take_off(plane) }.to raise_error 'No planes left!'
    end
  end

  describe '#check_stormy' do
    it 'produces true or false randomly' do
      stormy_options = [true, false]
      expect(stormy_options). to include(airport.check_stormy)
    end
  end

end
