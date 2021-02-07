require './lib/airport.rb'

describe Airport do

  it "responds to being told to let an plane land" do
    airport = Airport.new
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "lands a plane" do
    airport = Airport.new
    plane = double(:plane)
    allow(airport).to receive(:stormy?) { false }
    expect(airport.land(plane)).to eq [plane]
  end

  it "responds to being told to let an plane take_off" do
    airport = Airport.new
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it "lets a plane take_off" do
    airport = Airport.new
    plane = double(:plane)
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    expect(airport.take_off(plane)).to eq plane
  end

  it "has a default capacity of DEFAULT_CAPACITY" do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#land" do
    it "raises an error when the airport is full and a plane tries to land" do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      Airport::DEFAULT_CAPACITY.times do
        airport.land(double(:plane))
      end
      expect { airport.land(double(:plane)) }.to raise_error "The airport is full"
    end

    it "raises an error when a plane that is already in the airport tries to land" do
      airport = Airport.new
      plane = double(:plane)
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error "This plane is already in the airport"
    end

    it "raises an error if it is too stormy to land a plane" do
      airport = Airport.new
      plane = double(:plane)
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land(plane) }.to raise_error "It is too stormy to land"
    end
  end

  describe "#take_off" do
    it "raises an error when told to allow a plane to take off that isn't in the airport" do
      airport = Airport.new
      plane = double(:plane)
      expect { airport.take_off(plane) }.to raise_error "This plane is not in the airport"
    end

    it "raises an error if it is too stormy for a plane to take off" do
      airport = Airport.new
      plane = double(:plane)
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy?) { true }
      expect { airport.take_off(plane) }.to raise_error "It is too stormy to take off"
    end
  end

  it "responds to being asked the location of a place" do
    airport = Airport.new
    expect(airport).to respond_to(:location).with(1).argument
  end

  it "confirms if a plane has taken off" do
    airport = Airport.new
    plane = double(:plane)
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.location(plane)).to eq "This plane is airborne"
  end

  it "cofirms if a plane is in the airport" do
    airport = Airport.new
    plane = double(:plane)
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    expect(airport.location(plane)).to eq "This plane is grounded in the airport"
  end

  it "confirms if an plane is in the airport" do
    airport = Airport.new
    plane = double(:plane)
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    expect(airport.location(plane)).to eq "This plane is grounded in the airport"
  end

  it "allows the user to choose the capacity" do
    airport = Airport.new(10)
    expect(airport.capacity).to eq 10
  end

  it "responds to change_capacity" do
    airport = Airport.new
    expect(airport).to respond_to(:change_capacity).with(1).argument
  end

  it "allows the user to change the capacity when required" do
    airport = Airport.new
    airport.change_capacity(10)
    expect(airport.capacity).to eq 10
  end

  it "is randomly stormy" do
    airport = Airport.new
    expect(airport.stormy?).to be(true).or be(false)
  end

  it "responds to percentage" do
    airport = Airport.new
    expect(airport).to respond_to(:bad_weather_percentage).with(1).argument
  end

  it "allows user to set percentage of bad weather" do
    airport = Airport.new
    expect(airport.bad_weather_percentage(30)).to eq 3
  end

end
