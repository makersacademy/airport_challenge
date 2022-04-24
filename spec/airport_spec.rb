require "airport"
require "plane"

describe Airport do
  let(:plane) { Plane.new }
  
  describe '#land' do
    it "accepts 1 argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "adds plane to @planes array" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it "prevents landing when the subject is full" do
      subject.planes = Array.new(Airport::DEFAULT_CAPACITY, plane)
      expect{subject.land(plane)}.to raise_error "Airport is full."
    end

    it "prevents landing when the weather is stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.land(plane)}.to raise_error "Weather is stormy. You can't land the plane."
    end

    it "plane lands when the weather is sunny" do
      allow(subject).to receive(:stormy?).and_return(false)
      expect{subject.land(plane)}.not_to raise_error
    end
  end

  describe '#take_off' do
    it "accepts 1 argument" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "removes plane from @planes array" do
      subject.planes = ["plane1", plane, "plane2"]
      allow(subject).to receive(:stormy?).and_return(false)
      subject.take_off(plane)
      expect(subject.planes).to eq ["plane1", "plane2"]
    end

    it "prevents take off when the weather is stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.take_off(plane)}.to raise_error "Weather is stormy. You can't take off the plane."
    end

     it "plane takes off when the weather is sunny" do
      allow(subject).to receive(:stormy?).and_return(false)
      expect{subject.take_off(plane)}.not_to raise_error
    end

    it "plane can't takes off when it is not working" do
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:working?).and_return(false)
      expect{subject.take_off(plane)}.to raise_error "Plane is not working."
    end

  end

  describe '#full?' do
    it "accepts 0 arguments" do
      expect(subject).to respond_to(:full?).with(0).arguments
    end

    it "returns true when there are default capacity planes" do
      subject.planes = Array.new(Airport::DEFAULT_CAPACITY, plane)
      expect(subject.full?).to eq true
    end

    it "returns false when there are less planes than default capacity" do
      subject.planes = Array.new(Airport::DEFAULT_CAPACITY - 1, plane)
      expect(subject.full?).to eq false
    end

    it "returns false when overridden @capacity" do
      big_airport = Airport.new(100)
      big_airport.planes = Array.new(99, plane)
      expect(big_airport.full?).to eq false
    end
  end

  describe '#stormy?' do
    it "accepts 0 argument" do
      expect(subject).to respond_to(:stormy?).with(0).argument
    end

    it "returns true when the weather is stormy" do
      allow(subject).to receive(:rand).and_return(0)
      expect(subject.stormy?).to eq true
    end

    it "returns false when the weather is sunny" do
      allow(subject).to receive(:rand).and_return(3)
      expect(subject.stormy?).to eq false
    end
  end
end