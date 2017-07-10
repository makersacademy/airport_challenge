require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { described_class.new }
  let(:airport2) { described_class.new(30) }
  let(:plane) { double(:plane, location: "In Air") }
  let(:plane2) { double(:plane2, location: "Gatwick") }

  it "responds to the land method" do
    expect(airport).to respond_to :land
  end

  it "stores a plane that has landed" do
    expect(airport.land(plane)).to eq [plane]
  end

  it "checks to see if the airport is at max capacity before allowing a plane to land" do
    expect(subject.max_capacity?).to eq false
  end

  it "only allows planes that are currently in the air to land" do
    expect { airport.land(plane2) }.to raise_error("This plane is already on the ground!")
  end

  it "refuses to allow a plane to land if the airport is at max capacity" do
    20.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error("Too many planes! Land somewhere else!")
  end

  it "responds to the takeoff method" do
    expect(airport).to respond_to :takeoff
  end

  it "returns an instance of a plane when the takeoff method is called" do
    airport.land(plane)
    expect(airport.takeoff).to eq plane
  end

  it "prevents a plane from taking off in stormy weather" do
    allow(airport).to receive(:bad_weather) { true }
    expect { airport.takeoff }.to raise_error("Too stormy! Wait for better weather!")
  end

  it "has a default max capacity" do
    expect(airport.capacity_max).to eq 20
  end

  it "can have a different max capacity set upon instantiation" do
    expect(airport2.capacity_max).to eq 30
  end

  it "sets a weather value when first created" do
    allow(airport).to receive(:bad_weather) { false }
    expect(airport.bad_weather).to eq false
  end

  it "prevents a plane from landing in stormy weather" do
    allow(airport).to receive(:bad_weather) { true }
    expect { airport.land(plane) }.to raise_error("Too stormy! Land somewhere else!")
  end
end
