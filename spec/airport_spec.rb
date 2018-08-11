require 'airport'

describe Airport do
  it 'lands a plane' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

# describe '#takeoff' do
#   it 'plane takes off' do
#     plane = Plane.new
#     subject.takeoff
#     expect(subject.takeoff).to eq plane
#   end

  it 'instructs plane to takeoff' do
    expect(subject).to respond_to(:takeoff)
  end

  # it 'confirms plane is no longer at the airport' do
  #   plane = Plane.new
  #   subject.land_plane(plane)
  #   expect(subject.takeoff[-1]).to eq plane
  # end

  it 'raises error if the weather is stormy' do
    expect {subject.takeoff}.to raise_error 'weather is stormy'
  end

  it 'raises error if the weather is stormy' do
    expect {subject.land_plane.with(1).argument}.to raise_error 'weather is stormy'
  end

end
