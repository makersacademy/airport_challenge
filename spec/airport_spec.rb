require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let (:plane) { double (:plane) }
  let (:stormy_false) { allow(subject).to receive(:stormy?) { false } }
  let (:stormy_true) { allow(subject).to receive(:stormy?) { true } }

  describe "#land" do

    it "Should land plane at airport" do
      stormy_false
      expect{ subject.land(plane) }.to change{ subject.planes.include?(plane) }
    end

    it "Should land plane at airport if not already landed" do
      stormy_false
      subject.land(plane)
      expect{ subject.land(plane) }.to raise_error "Plane already landed"
    end

    it "Should return error if weather is bad" do
      stormy_true
      expect{ subject.land(plane) }.to raise_error "Bad weather for landing"
    end

    it "Should return error if airport is full" do
      stormy_false
      expect{ 21.times { subject.land(double :plane) } }.to raise_error "Airport full"
    end
  end

  describe "#plane_take_off" do

    it "Should return error if weather is bad" do
      stormy_false
      subject.land(plane)
      stormy_true
      expect{ subject.take_off(plane) }.to raise_error "Bad weather for take off"
    end

    it 'Should return error if airport is empty' do
      stormy_false
      expect{ subject.take_off(plane) }.to raise_error "Airport is empty"
    end

    it 'Should allow plane to take off if weather is good' do
      stormy_false
      subject.land(plane)
      expect{ subject.take_off(plane) }.to change { subject.planes.include?(plane) }
    end
  end

  describe "overwrites capacity" do

    it "Should initialize with a capacity of 20" do
      expect(subject.capacity).to eq(Airport::CAPACITY)
    end

    it "Should overwrite capacity" do
      airport = Airport.new(30)
      expect(airport.capacity).to eq(30)
    end
  end
end
