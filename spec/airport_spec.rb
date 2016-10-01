require './lib/airport'
require './lib/plane'

describe Airport do

let(:plane) { Plane.new }

  it 'receives a plane' do
      expect(subject).to respond_to(:receive_plane).with(1).argument
  end

  it 'stores a received plane' do
    subject.receive_plane(plane)
    expect(subject.planes).to eq([plane])
  end

  it 'stores multiple received planes' do
    subject.receive_plane(plane)
    subject.receive_plane(plane)
    expect(subject.planes).to eq([plane,plane])
  end

  it 'records that a plane is no longer at the airport once it takes off' do
    subject.receive_plane(plane)
    subject.release_plane(plane)
    expect(subject.planes).to eq([])
  end

  it 'allows you to check whether a specific plane is at an airport' do
    subject.receive_plane(plane)
    subject.release_plane(plane)
    expect(subject.plane_at_airport(plane)).to eq false
  end

end
