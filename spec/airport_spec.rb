require 'airport'

describe Airport do

  let(:plane) { double :plane }

  # it 'accepts a "land_plane" method which accepts a plane object as an argument' do
  #   expect(subject).to respond_to(:land_plane).with(1).argument
  # end

  it 'can add a plane to an array of planes in the airport by calling the "land_plane" method' do
    expect(subject.land_plane(plane).planes).to eq [plane]
  end

  # it 'accepts a "take_off_plane" method which accepts a plane object as an argument' do
  #   expect(subject).to respond_to(:take_off_plane).with(1).argument
  # end

  it 'removes a plane from the airport when the "take_off_plane" method is called' do
    airport = subject.land_plane(plane)
    expect(airport.take_off_plane(plane).planes.include?(plane)).to eq false
  end

end
