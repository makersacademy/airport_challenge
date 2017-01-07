require 'airport'

describe Airport do

  it 'instruct a plane to land and confirm that it landed' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

 it 'instruct a plane to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'confirm that the plane is no longer in the airport' do
  expect(subject.planes).to be_empty
  end

end
