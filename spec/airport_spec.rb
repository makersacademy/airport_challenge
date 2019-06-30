require './lib/airport.rb'

describe Airport do

  it "Has the capacity set to a default" do
    airport = Airport.new()
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  describe '#capacity' do
    it "Allows for setting up a different capacity" do
      airport = Airport.new(30)
      expect(airport.capacity).to eq(30)
    end

    it "Confirms plane has left" do
      plane = double(:plane)
      allow(plane).to receive(:grounded?) { false }
      airport = Airport.new(3)
      airport.land(plane)
      plane2 = airport.takeoff
      expect(plane.grounded?).to eq(false)
    end
  end

  describe '#weather_generator' do
    it "Checks whether the random weather generator returns a value" do
      expect(subject.weather_generator.instance_of? String).to eq(true)
    end
  end

  describe "#takeoff" do
    it "raises error if the plane tries to takeoff while weather is bad" do
      airport = Airport.new
      airport.weather_generator
      expect{airport.takeoff}.to raise_error('Can not takeoff while weather is this bad')
    end
  end

  describe '#land' do
    it "raises error if the plane tries to land while weather is bad" do
      airport = Airport.new
      airport.weather_generator
      expect{airport.land(double(:bike))}.to raise_error('Can not land while weather is this bad')
    end

    it "Should prevent landing if capacity is full" do
      airport = Airport.new
      200.times{airport.land(double(:bike))}
      expect{airport.land(double(:bike))}.to raise_error("Airport is full!")
    end
  end

end
