require 'airport'

describe Airport do
  context "Weather Conditions" do
    it "should confirm if the weather is stormy" do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end

  context "Inventory" do

    it "should confirm if a plane is at the airport" do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      plane.land(subject)
      expect(subject.in_airport?(plane)).to be true
    end

    it "should be able to check if the hangar is full" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.capacity.times { Plane.new.land(subject) }
      expect(subject.full?).to eq true
    end

    it "should have a default capacity" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
  end
end
