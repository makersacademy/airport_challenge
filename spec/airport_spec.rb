require 'airport'
describe Airport do
let(:plane) { Plane.new}
  # it 'has an airport that can instruct planes' do

  it 'can land a plane' do
    expect(subject).to respond_to(:land_plane)
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
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
      expect(subject.take_off_plane(plane)).to eq "Plane has left the airport"
    end
  end
end
