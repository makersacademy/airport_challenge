require 'airport'
require 'plane'


describe Airport do
  plane = Plane.new
  it 'instructs planes to land' do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it "instructs planes to take off" do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end

  it "raises error if it is at capacity and a plane tries to land" do
    allow(subject).to receive(:stormy?) { false }
    subject.capacity.times {subject.land(Plane.new)}
    expect {subject.land(Plane.new)}.to raise_error("no room")
  end

  it "raises an error if plane has already landed" do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    allow(subject).to receive(:stormy?) { false }
    expect {subject.land(plane)}.to raise_error("plane already landed")
  end

  it "raises an error if stormy and plane tried to land" do
    allow(subject).to receive(:stormy?) { true }
    expect {subject.land(Plane.new)}.to raise_error "stormy"
  end


  it "raises an error if stormy and plane tried to takeoff" do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    allow(subject).to receive(:stormy?) { true }
    expect {subject.take_off(plane)}.to raise_error "stormy"
  end

end
