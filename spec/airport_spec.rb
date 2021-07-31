require 'airport'

describe Airport do
  it 'lands a plane' do
    expect(subject).to respond_to :land_airplane
  end

  it 'a plane can take-off' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { false }
    subject.land_airplane(plane)
    subject.takeoff_airplane(plane)
    expect(subject.planes).not_to include(plane)
  end

  it 'prevents landing if airport is full' do
    allow(subject).to receive(:stormy?) { false }
    expect { (Airport::DEFAULT_CAPAPCITY + 1).times { subject.land_airplane Plane.new } }.to raise_error "airport full"
  end

  it 'prevents landing if plane is not flying' do
    plane = Plane.new
    subject.land_airplane(plane)
    expect { subject.land_airplane(plane) }.to raise_error "plane already landed"
  end

  it 'prevents a plane from taking off if not at airport' do
    plane = Plane.new
    expect { subject.takeoff_airplane(plane) }.to raise_error "plane not at airport"
  end
  
  it 'prevents a plane from landing if stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land_airplane(plane) }.to raise_error "weather is stormy"
  end

  it 'prevents a plane from taking off if stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { false }
    subject.land_airplane(plane)
    allow(subject).to receive(:stormy?) { true }
    expect { subject.takeoff_airplane(plane) }.to raise_error "weather is stormy"
  end
end
