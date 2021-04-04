require 'airport'

describe Airport do
  
  it 'airport responds to land' do
    allow(subject).to receive(:stormy?).and_return false
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'airport responds to takeoff' do
    allow(subject).to receive(:stormy?).and_return false
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it 'plane lands in airport' do
    allow(subject).to receive(:stormy?).and_return false
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'plane takesoff from airport' do
    allow(subject).to receive(:stormy?).and_return false
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq plane
  end

  it 'confirms planes are no longer in the airport' do
    allow(subject).to receive(:stormy?).and_return false
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.no_longer_in_airport(plane)).to eq "The plane is no longer in the airport"
  end

  it 'prevents landing when airport is full' do
    allow(subject).to receive(:stormy?).and_return false
    plane = Plane.new
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error("Airport is full")
  end

  it 'is the weather stormy?' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'prevents planes from landing when stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.land(plane) }.to raise_error("Too stormy to land")
  end

  it 'prevents planes from taking off when stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.takeoff(plane) }.to raise_error("Too stormy to takeoff")
  end
end
