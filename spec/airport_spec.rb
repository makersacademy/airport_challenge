require 'airport'

describe Airport do
  subject(:airport){described_class.new}
  it 'instructs a plane to land' do
    expect(airport).to respond_to(:instruct_plane_to_land).with(1).argument
  end

  it 'instructs a plane to land and increases the planes array by 1' do
    plane = Plane.new
    expect{airport.instruct_plane_to_land(plane)}.to change{subject.plane_count}.by(1)
  end

  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:instruct_plane_to_take_off)
  end

  it 'confirms that the plane is no longer in the airport' do
    plane = Plane.new
    subject.planes << plane
    expect {airport.instruct_plane_to_take_off(plane)}.to change{subject.plane_count}.by(-1)
  end


end
