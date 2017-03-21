require './lib/airport'
require './lib/weather_check'

  describe Airport do
  subject(:airport) { described_class.new }
  describe "#Land Plane" do

it "checks that land method returns new status landed" do
    plane1 = Plane.new
      allow(airport).to receive(:full?) {false}
      allow(airport).to receive(:ready_to_land?) {false}
      allow(airport).to receive(:stormy?) {false}
      expect(airport.land(plane1)).to eq [plane1]
    end
end

  describe "#Landed?" do
    it "checks that landed? method returns true if plane is stored in airplanes" do
      plane1 = Plane.new
      allow(airport).to receive(:ready_to_land?) {false}
      allow(airport).to receive(:stormy?) {false}
      airport.land(plane1)
      expect(airport.landed?(plane1)).to eq true
    end
end

  describe "#Takeoff" do
end


  describe "#Ready_to_land?" do
  it "checks that plane cannot land if already at airport" do
    plane1 = Plane.new
    allow(airport).to receive(:stormy?) {false}
    allow(airport).to receive(:full?) {false}
    airport.land(plane1)
    expect {airport.land(plane1)}.to raise_error "Plane can only land when flying."
  end

  it "checks that plane cannot land if weather is stormy" do
    plane1 = Plane.new
    allow(airport).to receive(:full?) {false}
    allow(airport).to receive(:ready_to_land?) {false}
    allow(airport).to receive(:stormy?) {true}
    expect {airport.land(plane1)}.to raise_error "Plane cannot land due to stormy weather."
  end
end


  describe "#Ready to Takeoff?" do
    it "checks that plane cannot takeoff if not in airport" do
    plane1 = Plane.new
    allow(airport).to receive(:stormy?) {false}
    expect {airport.takeoff(plane1)}.to raise_error "Plane cannot takeoff if not landed in airport."
  end

  it "checks that plane cannot takeoff if weather is stormy" do
    plane1 = Plane.new
    allow(airport).to receive(:ready_to_takeoff?) {true}
    allow(airport).to receive(:stormy?) {true}
    expect {airport.takeoff(plane1)}.to raise_error "Plane cannot takeoff due to stormy weather."
  end
end

 describe "#Capacity" do
  it "creates airport with a default capacity of 5 planes" do
  expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
end


  it "checks that plane cannot land if airport is full" do
    plane1 = Plane.new
    allow(airport).to receive(:full?) {true}
    allow(airport).to receive(:ready_to_land?) {false}
    allow(airport).to receive(:stormy?) {false}
    expect {airport.land(plane1)}.to raise_error "There is no available space in this airport."
  end

  it "allows engineers to rewrite capacity" do
    n = rand(0..50)
    airport.capacity = n
    expect(airport.capacity).to eq n
    end
  end
end

#Plane cannot land in a different airport. Create airport?
#Plane cannot takeoff if in a different airport.
