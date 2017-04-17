require 'airport'

describe Airport do
  describe "#initialize" do
    it "sets the capacity to the default" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#park' do
    context "when the plane is not parked" do
      it "returns the plane object" do
        plane = double()
        expect(subject.park(plane)).to eq [plane]
      end
    end

    context "when the plane is parked" do
      it "raises an error" do
        plane = double()
        subject.park(plane)
        expect { subject.park(plane) }.to raise_error "The plane has been already parked"
      end
    end

    context "when the plane is en route" do
      it "raises an error" do
        plane = double()
        subject.en_route(plane)
        expect { subject.park(plane) }.to raise_error "The plane is en route"
      end
    end
  end

  describe "#full?" do
    context "the airport is full" do
      it "returns true" do
        3.times { subject.park(double()) }
        expect(subject.full?).to eq true
      end
    end

    context "the airport is not full" do
      it "returns false" do
        2.times { subject.park(double()) }
        expect(subject.full?).to eq false
      end
    end
  end

  describe "#en_route" do
    it 'returns the en route pleane' do
      plane = double()
      expect(subject.en_route(plane)).to eq plane
    end

    it 'removes the plane from the parked planes list' do
      plane = double()
      expect(subject.parked?(plane)).to eq false
    end
  end
end
