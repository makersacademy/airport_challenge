require 'airport'

describe Airport do
let (:plane) {double :plane, flying!: false, landed!: true}

it { is_expected.to respond_to(:land).with(1).argument }
it { is_expected.to respond_to(:take_off).with(1).argument }
it { is_expected.to respond_to(:planes)}

it "has a default capacity of MAX_CAPACITY" do
      expect(subject.capacity).to eq Airport::MAX_CAPACITY
    end

  describe "#land" do
    it "Lands a Plane" do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to eq [plane]
    end

    it "Adds a landed plane to the total list of planes" do
      allow(plane).to receive(:flying).and_return(true)
      allow(subject).to receive(:stormy?).and_return(false)
      plane1 = Plane.new
      plane2 = Plane.new
      subject.land(plane1)
      subject.land(plane2)
      expect(subject.planes).to eq [plane1, plane2]
    end

    it "Can confirm a plane has landed" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it "Won't land a plane when it's stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect {subject.land(plane)}.to raise_error "Conditions too stormy. No planes can land."
    end

    it "Raises an error when at capacity" do
        allow(subject).to receive(:full?).and_return(true)
        expect {subject.land(plane)}.to raise_error "Airport full! No Planes can land!"
    end

    it "Won't land a plane that has already been landed" do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.land(plane)
        expect {subject.land(plane)}.to raise_error "That plane is already on the ground!"

    end

  describe "#take_off" do
      it "Allows a plane to take off" do
        allow(subject).to receive(:stormy?).and_return(false)
        allow(subject).to receive(:present?).and_return(true)
        expect(subject.take_off(plane)).to eq plane
      end

      it "Won't take off a plane that isn't in the airport" do
      allow(plane).to receive(:flying!).and_return(true)
      expect {subject.take_off(plane)}.to raise_error "That plane isn't here!"
      end

      it "Won't take off a plane when it is stormy" do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.land(plane)
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.take_off(plane)}.to raise_error "Conditions too stormy. No planes can take off."
      end
    end
  end
end
