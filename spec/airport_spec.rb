require 'airport'

describe Airport do

  it "can be created" do
    expect(Airport.new).to be_an(Airport)
  end

  it "has a default capacity of 10" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    10.times { plane.land(airport) }

    expect(plane.land(airport)).to eq false
  end

  it "can be created with a different capacity" do
    plane = Plane.new
    airport = Airport.new(5)
    allow(airport).to receive(:weather).and_return("fine")

    5.times { plane.land(airport) }

    expect(plane.land(airport)).to eq false
  end

  it "correctly responts to stormy_weather? when it's stormy" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("stormy")

    expect(airport.stormy_weather?).to be true
  end

  it "correctly responts to stormy_weather? when it's fine" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    expect(airport.stormy_weather?).to be false
  end

  it "correctly responts to fine_weather? when it's fine" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    expect(airport.fine_weather?).to be true
  end

  it "correctly responts to fine_weather? when it's stormy" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("stormy")

    expect(airport.fine_weather?).to be false
  end

end
