require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  it "creates an airport" do
    expect(described_class).to eq Airport
  end

  it "creates an airport with a default capacity of 10 planes by default" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "creates an airport with a capacity of an arugment given" do
    airport = Airport.new(15)
    expect(airport.capacity).to eq 15
  end

  it "only holds the default number of planes" do
    Airport::DEFAULT_CAPACITY.times do
      subject.land(Plane.new)
    end
      expect{subject.land(Plane.new)}.to raise_error "Airport is full."
    end

  it "raises an error when a take-off is requested from an empty airport" do
    expect{subject.take_off}.to raise_error "Airport is empty"
  end

  it "allows planes to take-off" do
    plane1 = Plane.new
    subject.land(plane1)
    expect(subject.take_off).to eq plane1
  end

end
