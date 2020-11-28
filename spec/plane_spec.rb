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
    it 'change plane status from flying to landed' do
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

end
