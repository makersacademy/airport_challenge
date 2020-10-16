require 'airport'
require 'plane'

describe Airport do
  it 'the airport class exists' do
    expect(subject).to eq subject
  end
  it ' when a plane lands the stored planes increases by 1' do
    plane = Plane.new
    subject.land(plane)
    initial_storage = []
    expect(subject.storage.length).to eq initial_storage.length + 1
  end
  it 'allows a plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq "#{plane} landed at #{subject}"
  end
  it 'allows a plane to takeoff if it is at the airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq "#{plane} tookoff from #{subject}"
  end
  it 'plane will not takeoff if it is not at an airport' do
    plane = Plane.new
    expect { subject.takeoff(plane) }.to raise_error("#{plane} can't take off, it isn't at #{subject}")
  end
  it 'confirm a plane is at an airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.at_airport?(plane)).to eq "#{plane} is at #{subject}"
  end
  it 'confirm a plane is not at an airport' do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.at_airport?(plane)).to eq "#{plane} isn't at #{subject}"
  end
  it 'if the airport is full then a plane can not land' do
    plane = Plane.new
    plane2 = Plane.new
    subject.land(plane)
    expect { subject.land(plane2) }.to raise_error("#{plane2} can't land at #{subject} as the airport is full!")
  end
end
