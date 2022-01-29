require 'airport'

describe Airport do
  describe '#initialize' do
    it "takes a default capacity when created" do
      expect(subject.capacity).to eq Airport::DEFAULT_AIRPORT_CAPACITY
    end
  end
  describe '#land' do
    it { expect(subject).to respond_to(:land).with(1).arguments }
    it "should let a plane land at the airport" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.land(plane)).to eq [plane]
    end
    it "should not land an 11th plane if airport capacity is set to 10" do
      airport = Airport.new(10)
      allow(airport).to receive(:stormy?).and_return(false)
      10.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error "Airport is full. Can't land"
    end
    it "should not land if default capacity is set and reached" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_AIRPORT_CAPACITY.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error "Airport is full. Can't land"
    end

  end

  describe '#take_off' do
    it { expect(subject).to respond_to(:take_off).with(1).arguments }
    it "should remove plane from the airport" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "flight #{plane} has taken off from runway 1"
    end
    it "should keep allowing planes to take off until airport empty" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      expect { airport.take_off(Plane.new) }.to raise_error "No planes available to fly"
    end
  end

  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }
    it "should return a boolean" do
      expect(subject.stormy?).to be(true).or be(false)
    end
    it "should stop a plane landing if it is stormy" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error(RuntimeError, "Bad weather: can't land")
    end
    it "should stop a plane taking-off if it is stormy" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error(RuntimeError, "Bad weather: can't take off")
    end
  end
end
