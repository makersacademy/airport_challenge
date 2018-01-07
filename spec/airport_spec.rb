require 'airport'

describe Airport do
  let(:weather) { double :weather }
  #let(:plane) { double :plane}

  describe '#default-capacity' do
    it "should create default airport capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should update capacity as required" do
      airport = Airport.new
      airport.capacity = 10
      expect(airport.capacity).to eq 10
    end
  end

  describe '#land' do
    it "should land at an airport" do
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return(false)
      airp = Airport.new(weather)
      airp.land(plane)
      expect(airp.airport.include?(plane)).to eq true
    end

    it "should prevent landing if stormy" do
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return(true)
      airport = Airport.new(weather)
      expect {airport.land(plane)}.to raise_error "Unable to land - stormy weather."
    end

    it "should prevent landing if airport full" do
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(weather)
      airport.land(plane)
      Airport::DEFAULT_CAPACITY.times {airport.land(Plane.new)}
      expect {airport.land(Plane.new)}.to raise_error "Unable to land - airport full."
    end

  end

  describe '#take-off' do
    it "instructs a plane to take off" do
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return(false)
      airp = Airport.new(weather)
      airp.land(plane)
      airp.take_off(plane)
      expect(airp.airport.include?(plane)).to eq false
    end

    it "should confirm plane has left the airport" do
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return(false)
      airp = Airport.new(weather)
      airp.land(plane)
      expect(airp.take_off(plane)).to eq "#{plane} no longer in airport."
    end

    it "should not take off if weather stormy" do
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return(true)
      airport_test = Airport.new(weather)
      expect { airport_test.take_off(plane) }.to raise_error 'Unable to take off - stormy weather.'
    end
  end
end
