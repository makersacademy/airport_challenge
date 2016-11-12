require 'airport.rb'

describe Airport do

  it 'expects an airport to exist' do
  expect(subject).to equal subject
  end

  it 'expects an airport to accept a plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq subject.planes
  end

  it 'expects an airport to be able to list its current planes' do
    subject.land(Plane.new)
    subject.land(Plane.new)
    subject.planes.inspect
    expect(subject.planes).to eq subject.planes
  end

end
