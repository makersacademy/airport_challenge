require 'plane'

describe Plane do
  let(:plane) { described_class.new }
  it 'responds to land_plane method' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'responds to flying? method' do
    expect(subject).to respond_to(:flying?)
  end

  it 'responds to take_off method' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  describe '#land_plane' do
    it 'updates current airport' do
      airport = Airport.new
      plane.land_plane(airport)
      expect(plane.current_airport).to eq airport
    end

    it 'raises error if plane is already on the ground' do
      airport = Airport.new
      plane.land_plane(airport)
      expect { plane.land_plane(airport) }.to raise_error 'Plane has already landed'
    end
  end

  describe '#flying?' do
    it 'verifies a landed plane has landed' do
      airport = Airport.new
      plane.land_plane(airport)
      expect(plane.current_airport).to be_truthy
    end

    it 'verifies a flying plane is flying' do
      expect(plane.current_airport).to be_nil
    end
  end

  describe '#take_off' do
    it 'updates current airport' do
      airport = Airport.new
      plane.land_plane(airport)
      plane.take_off(airport)
      expect(plane.current_airport).to eq nil
    end

    it 'raises error if plane is already in the air' do
      airport = Airport.new
      expect { plane.take_off(airport) }.to raise_error 'Plane is already flying'
    end

    it 'raises error when trying to takeoff from airport where plane is not currently located' do
      airport = Airport.new
      airport1 = Airport.new
      plane.land_plane(airport)
      expect { plane.take_off(airport1) }.to raise_error 'Plane located at different airport'
    end
  end
end
