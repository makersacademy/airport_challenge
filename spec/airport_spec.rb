require "airport"

describe Airport do
  it "responds to land" do
    expect(subject).to respond_to(:land).with(2).arguments
  end

  it "stores a plane when it lands" do
    plane = double(:plane)
    weather = double(:weather, stormy?: false)
    expect(subject.land(plane, weather)).to match_array [plane]
  end

  it "responds to take_off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "lands a plane and then removes it when it takes off" do
    plane = double(:plane)
    weather = double(:weather, stormy?: false)
    subject.land(plane, weather)
    expect(subject.take_off(weather)).to eq plane
  end

  it "does not let a plane land if the airport is full" do
    weather = double(:weather, stormy?: false)
    Airport::DEFAULT_CAPACITY.times { subject.land(double(:plane), weather) }
    expect { subject.land(double(:plane), weather) }.to raise_error "Airport full"
  end

  it "has a default capacity if one is not provided" do
    airport = Airport.new
    expect(airport.capacity).to eq 100
  end

  it "can be initialised with a different capacity" do
    airport = Airport.new(75)
    expect(airport.capacity).to eq 75
  end

  it "can change capacity after initialisation" do
    airport = Airport.new()
    airport.capacity = 50
    expect(airport.capacity).to eq 50
  end

  it "prevents take off when the weather is stormy" do
    weather = double(:weather, stormy?: true)
    expect { subject.take_off(weather) }.to raise_error "Can not take off, weather is stormy"
  end

  it "prevents landing when the weather is stormy" do
    plane = double(:plane)
    weather = double(:weather, stormy?: true)
    expect { subject.land(plane, weather) }.to raise_error "Can not land, weather is stormy"
  end
end
