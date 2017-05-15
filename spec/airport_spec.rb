require 'airport'

describe Airport do
  it "responds to the land method" do
    plane = Plane.new
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "confirms landing" do
    plane = Plane.new
    allow(subject).to receive(:stormy) { false }
    expect(subject.land(plane)).to eq plane
  end
  it "responds to the take_off method" do
    plane = Plane.new
    plane.land
    expect(subject).to respond_to(:take_off).with(1).argument
  end
  it "confirms take-off" do
    plane = Plane.new
    allow(subject).to receive(:stormy) { false }
    expect(subject.take_off(plane)).to eq nil
  end
  describe '#take_off' do
  it "should raise an error when weather is stormy" do
  plane = Plane.new
  allow(subject).to receive(:stormy) { false }
  subject.land(plane)
  allow(subject).to receive(:stormy) { true }
  expect { subject.take_off(plane) }.to raise_error("Unsafe conditions, take-off not permitted")
end
end
  describe '#land' do
  it "should raise an error when weather is stormy" do
  plane = Plane.new
  allow(subject).to receive(:stormy) { true }
  expect { subject.land(plane) }.to raise_error("Unsafe conditions, landing not permitted")
end
end
end
