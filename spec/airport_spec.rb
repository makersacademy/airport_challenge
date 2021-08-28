require 'airport'
require 'plane'

describe Airport do

  it 'can allow a plane to land' do
    allow(subject).to receive(:weather?) { "sunny" }
    expect subject.land_plane(Plane.new) == "Plane has successfully landed"
  end

  it 'can instruct a plane to depart from an airport' do
    allow(subject).to receive(:weather?) { "sunny" }
    plane1 = Plane.new
    subject.land_plane(plane1)
    expect subject.takeoff(plane1) == "Plane has now departed"
  end

  it 'will not allow a plane to land if the airport is full' do
    allow(subject).to receive(:weather?) { "sunny" }
    subject.land_plane(Plane.new)
    expect { subject.land_plane(Plane.new) }.to raise_error "Insufficient capacity" 
  end

  it 'will not allow a plane to take off if it is not at the airport' do
    allow(subject).to receive(:weather?) { "sunny" }
    expect { subject.takeoff(Plane.new) }.to raise_error "Plane not at airport!" 
  end

  it 'will not allow a plane to land if the weather is stormy' do
    allow(subject).to receive(:weather?) { "stormy" }
    expect { subject.land_plane(Plane.new) }.to raise_error "Stormy weather, impossible to land" 
  end

  it 'will not allow a plane to take off if the weather is stormy' do
    allow(subject).to receive(:weather?) { "stormy" }
    allow(subject).to receive(:land_plane) { landed_planes << Plane.new }
    expect { subject.takeoff(Plane.new) }.to raise_error "Stormy weather, impossible to take off" 
  end

end
