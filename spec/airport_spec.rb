require 'airport'

RSpec.describe Airport do
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:land).with(1).argument }

  it "instructs plane to land at airport" do
    airport = Airport.new
    allow(airport).to receive(:stormy).and_return(false)
    plane = Plane.new
    airport.land(plane)
    expect(airport.num_of_planes.include?(plane)).to eq(true)
  end

  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "instructs plane to take off and confirms no longer in airport" do
    airport = Airport.new
    allow(airport).to receive(:stormy).and_return(false)
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.num_of_planes.include?(plane)).to eq(false)
  end

  it "prevents take off when stormy" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    allow(airport).to receive(:stormy).and_return(true)
    expect { airport.take_off(plane) }.to raise_error "Too stormy to take off"
  end

  it "prevents landing when weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy).and_return(true)
    expect { airport.land(plane) }.to raise_error "Too stormy to land"
  end

  it "prevents landing when airport is full" do
    airport = Airport.new
    allow(airport).to receive(:stormy).and_return(false)
    plane = Plane.new
    plane1 = Plane.new
    airport.land(plane)
    expect { airport.land(plane1) }.to raise_error("Airport at capacity, no landings")
  end

end
