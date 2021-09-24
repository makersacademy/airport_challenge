require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  
  describe '#initialize' do
    it 'should set a default capacity if one is not provided' do
      expect(airport.capacity).to eq(20)
    end

    it 'should change the capacity if one is provided' do
      airport = described_class.new(30)
      expect(airport.capacity).to eq(30)
    end

    it 'should initialize an empty array of planes in airport' do
      expect(airport.planes).to eq([])
    end
  end

  describe '#add_plane' do
    it 'should add a plane to the planes array when plane has landed at airport' do
      expect(airport.add_plane(plane)).to eq("Plane added to hangar!")
      expect(airport.planes).to eq([plane])
      expect(airport.planes.length).to eq(1)
    end
  end

  describe '#remove_plane' do
    it 'should remove a plane from the planes array when a plane has taken off from the airport' do
      airport.add_plane(plane)
      expect(airport.planes.length).to eq(1)
      expect(airport.remove_plane(plane)).to eq("Plane removed from hangar!")
      expect(airport.planes).to eq([])
      expect(airport.planes.length).to eq(0)
    end
  end

  describe '#full?' do
    it 'should return false when the airport is not at capacity' do
      expect(airport.full?).to eq(false)
    end

    it 'should return true when the airport is at capacity' do
      20.times do
        airport.add_plane(plane)
      end
      expect(airport.full?).to eq(true)
    end
  end

end
