require './lib/airport.rb'

describe Airport do
  it "respond to method land" do
    expect(subject).to respond_to(:land)
  end
  it "respond to method take_off" do
    expect(subject).to respond_to(:take_off)
  end
  it "plane takes off and no more planes left" do
    plane = Plane.new
    weather = Weather.new
    subject.land(plane)
    allow(weather).to receive(:stormy?).and_return false
    subject.take_off(plane)
    expect(subject.instance_variable_get(:@planes).empty?).to eq(true)
  end
  it "plane is no longer in the airport" do
    expect { subject.take_off(:plane) }.to raise_error('No planes present')
  end
  it "preventing take-off when stormy" do
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.take_off(plane) }.to raise_error('Bad weather, take-off denied')
  end
  it "preventing landing when stormy" do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.land(plane) }.to raise_error('Bad weather, landing denied')
  end
end
