require 'airport'

class DoublePlane
end

describe Airport do

  let (:plane) { DoublePlane.new}

  describe "#land" do
    it "should land plane at airport" do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.planes.include?(plane)).to eq true
    end

    it "Should return error if weather is bad" do
      allow(subject).to receive(:stormy?) { true }
      expect{ subject.land(plane) }.to raise_error("Bad weather for landing")
    end

    it "Should return error if airport is full" do
      allow(subject).to receive(:stormy?) { false }
      expect{21.times { subject.land(plane) }  }.to raise_error("Airport full")
    end
  end

  describe "#plane_take_off" do

    it "Should return error if weather is bad" do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect{ subject.take_off }.to raise_error("Bad weather for take off")
    end

    it 'Should return error if airport is empty' do
      expect{ subject.take_off }.to raise_error "airport is empty"
    end

    it 'Should make plane take off if weather is good' do
       allow(subject).to receive(:stormy?) { false }
       subject.land(plane)
       expect{ subject.take_off }.to change { subject.planes.include?(plane) }
    end
  end

  describe "overwrites capacity" do

    it "should initialize with a capacity of 20" do
      expect(subject.capacity).to eq(Airport::CAPACITY)
    end

    it "should overwrite capacity" do
      airport = Airport.new(30)
      expect(airport.capacity).to eq(30)
    end
  end

  describe "BONUS TEST" do
    it "should take off and land a number of planes" do
    allow(subject).to receive(:stormy?) { false }
    15.times { subject.land(plane)}
    13.times { subject.take_off}
    end
  end

end
