require 'airport.rb'

describe Airport do
  it 'a plane lands in the airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'a plane takes off from the airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end
end
