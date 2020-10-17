require './lib/airport.rb'

RSpec.describe Airport do
  describe "land" do
    it "plane to land" do
      plane = Plane.new

      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
    it "raise warning that airport is full" do
      airport = Airport.new
      planes = 30.times{airport.land(Plane.new)}
      expect{
        airport.land(Plane.new)
      }.to raise_error(RuntimeError)

    end
  end
  describe "take off" do

    it "plane takes off" do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport.take_off).to eq(plane)
    end
  end

  describe "capacity" do
    it "default capacity check" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
  end

end
