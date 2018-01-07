require 'airport'

describe Airport do
  let(:weather) { double :weather }
  #let(:plane) { double :plane}

  describe '#land' do
    it "should land at an airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.airport).to eq plane
    end
  end

  describe '#take-off' do
    it "instructs a plane to take off" do
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return(false)
      airp = Airport.new(weather)
      airp.land(plane)
      airp.take_off(plane)
      expect(airp.airport).to eq nil
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
      airport_test.land(plane)
      expect { airport_test.take_off(plane) }.to raise_error 'Unable to take off as stormy weather.'
    end
  end
end
