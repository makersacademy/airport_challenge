require './lib/airport.rb'

RSpec.describe Airport do
  describe "land" do
    it "plane land" do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
    it "raise warning that airport is full" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      planes = 30.times{airport.land(Plane.new)}
      plane = Plane.new
      expect{ airport.land(plane) }.to raise_error(RuntimeError)
  end


  describe "take off" do

    it "plane takes off" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(airport.take_off).to eq(plane)
    end
  end

  describe "capacity" do
    it "default capacity check" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
  end
  describe "stromy?" do
    it "gives a biased random sunny > stormy" do
      airport = Airport.new

      allow(airport).to receive(:stormy?) {true}

      expect(airport.stormy?).to eq(true)
    end
    it "causes flights to be grounded and landings aborted" do
    end
  end
end

end
