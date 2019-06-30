require 'airport'

describe Airport do

  it 'has a defult capacity' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#Take_off" do
    it "Doesn't take off with 'stormy weather'" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:random_weather) {"stormy"}
      expect{airport.take_off(plane)}.to raise_error "The plane can't take off with the stormy weather"
    end
  end

  describe "#land" do
    it "Can't land cause of stormy weather" do
      airport = Airport.new
      plane = Plane.new
      allow(plane).to receive(:fly?).and_return(true)
      allow(airport).to receive(:random_weather) {"stormy"}
      expect{airport.take_off(plane)}.to raise_error "The plane can't take off with the stormy weather"
    end

    it "Error airport full" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:random_weather) {"sunny"}
      50.times { airport.land(plane)}
      expect {airport.land double(:plane)}.to raise_error "The airport is full"
    end
  end

  describe "#plane_status" do

    it "The plane is already flying" do
      airport = Airport.new
      plane = Plane.new
      plane = double(:plane, flying?: true)
      airport.land plane
      allow(airport).to receive(:random_weather) {"sunny"}
      expect {airport.plane_status(plane)}.to raise_error "The plane is already flying"
    end

    it "The plane is in the airport" do
      airport = Airport.new
      plane = Plane.new
      plane = double(:plane, flying?: false)
      airport.land plane
      allow(airport).to receive(:random_weather) {"sunny"}
      expect {airport.plane_status(plane)}.to raise_error "The plane is already in the airport"
    end

  end
end
