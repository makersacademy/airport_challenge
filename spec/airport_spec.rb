require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let (:plane) { double (:plane) }

  before "Set weather to not stormy" do
      allow(subject).to receive(:stormy?) { false }
   end

  describe "#land" do

    it "Should land plane at airport" do
      expect{ subject.land(plane) }.to change{ subject.planes.include?(plane) }
    end

    it "Should raise error if plane has already landed" do
      subject.land(plane)
      expect{ subject.land(plane) }.to raise_error "Plane already landed"
    end

    it "Should raise error if weather is bad" do
      allow(subject).to receive(:stormy?) { true }
      expect{ subject.land(plane) }.to raise_error "Bad weather for landing"
    end

    it "Should raise error if airport is full" do
      expect{ 21.times { subject.land(double :plane) } }.to raise_error "Airport full"
    end

end

  describe "#plane_take_off" do

    it "Should raise error if weather is bad" do
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect{ subject.take_off(plane) }.to raise_error "Bad weather for take off"
    end

    it 'Should raise error if airport is empty' do
      expect{ subject.take_off(plane) }.to raise_error "Airport is empty"
    end

    it 'Should raise error if airport plane is not present' do
      plane2 = double:plane
      subject.land(plane2)
      expect{ subject.take_off(plane) }.to raise_error "Plane not present"
    end

    it 'Should allow plane to take off if weather is good' do
      subject.land(plane)
      expect{ subject.take_off(plane) }.to change { subject.planes.include?(plane) }
    end
  end

  describe "overwrite capacity" do

    it "Should initialize with a capacity of 20" do
      expect(subject.capacity).to eq(Airport::CAPACITY)
    end

    it "Should overwrite capacity" do
      airport = described_class.new(30)
      expect(airport.capacity).to eq(30)
    end
  end
end
