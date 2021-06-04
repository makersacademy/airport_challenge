require 'airport'
describe Airport do
let(:plane) { Plane.new }
let(:airport) { Airport.new }
  # it 'has an airport that can instruct planes' do

  it 'can land a plane if space is available' do
    expect(subject.land_plane(plane)).to eq('Plane landed')
  end

  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows the default capacity to be overriden' do
      new_capacity = rand(1000)
      large_airport = Airport.new(new_capacity + 1)
      new_capacity.times { large_airport.land_plane Plane.new }
      expect(large_airport.land_plane(Plane.new)).to eq('Plane landed')
    end
  end

  it 'raises an error when trying to land a plane while at maximum capacity' do
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
    expect{ subject.land_plane Plane.new }.to raise_error 'Airport at maximum capacity, cannot land plane'
  end

  describe '#take_off_plane' do
    it 'can tell a plane to take off' do
      expect(subject).to respond_to(:take_off_plane)
    end

    it 'confirms the plane is no longer at the airport' do
      # plane = Plane.new
      expect(subject.take_off_plane(plane)).to eq "Plane has left the airport"
    end

    it 'raises an error while trying to take off during stormy weather' do
      allow(airport).to receive(:stormy?) { 10 }
      expect{ airport.take_off_plane Plane.new }.to raise_error 'Cannot take off due to storm'
    end
  end
end
