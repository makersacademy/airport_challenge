require 'airport'
require 'weather'

describe Airport do
  subject(:airport) {described_class.new}

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "can set the capacity" do
    airport = Airport.new(1000)
    expect(airport.capacity).to eq 1000
  end

  it "can tell 2 planes have landed" do
    plane1 = double(:plane)
    allow(plane1).to receive(:land).with(subject).and_return(subject.planes << plane1)
    plane2 = double(:plane)
    allow(plane2).to receive(:land).with(subject).and_return(subject.planes << plane2)
    plane1.land(subject)
    plane2.land(subject)
    expect(subject.planes).to eq [plane1,plane2]
  end

  it "knows when it is full" do
    36.times do
      subject.planes << Plane.new
    end
    expect(subject.full).to be true
  end

end
