require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  context 'when setting capacity' do

    it 'sets capacity to the correct amount' do
      airport.set_capacity(10)
      expect(airport.capacity).to eq(10)
    end

    it 'accepts only positive numbers' do
      expect(airport.set_capacity(-5)).to eq("Capacity cannot be negative")
    end

  end

  context 'when accepting a plane to land' do

    it 'responds to the #accept_plane method' do
      expect(airport).to respond_to(:accept_plane)
    end

    it 'if landing permission granted, return that confirmation and stores plane in airport\'s instance variables' do
      expect(airport.accept_plane(plane)).to eq true
      expect(airport.planes).to eq([plane])
    end

    it 'if permission denied, return a messages stating why the plane may not land' do
      airport.set_capacity(0)
      expect(airport.accept_plane(plane)).to eq("Airport already at capacity")
    end

  end

end

