require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}
  
  describe '#initialize' do
    it 'should set a default capacity if one is not provided' do
      expect(airport.CAPACITY).to eq(20)
    end

    it 'should change the capacity if one is provided' do
      airport = described_class.new(30)
      expect(airport.CAPACITY).to eq(30)
    end

    it 'should initialize an empty array of planes in airport' do
      expect(airport.get_planes).to eq([])
    end
  end

  describe '#add_plane' do
    it 'should add a plane to the planes array when plane has landed at airport' do
      expect(airport.add_plane(plane)).to eq("Plane added to hangar!")
      expect(airport.get_planes).to eq([plane])
      expect(airport.get_planes.length).to eq(1)
    end
  end

  describe '#remove_plane' do
    it 'should remove a plane from the planes array when a plane has taken off from the airport' do
      airport.add_plane(plane)
      expect(airport.get_planes.length).to eq(1)
      expect(airport.remove_plane(plane)).to eq("Plane removed from hangar!")
      expect(airport.get_planes).to eq([])
      expect(airport.get_planes.length).to eq(0)
    end
  end

end