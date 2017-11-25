require "airport"

describe Airport do

  let(:plane) { double :plane, landed: nil, land: nil, take_off: nil }

  describe "#initialize" do
    it "should ensure that the default capacity is set to 10" do
      expect(subject.capacity).to eq 10
    end

    it "should allow the user to set the capacity" do
      expect(Airport.new(20).capacity).to eq 20
    end
  end

  describe "#land" do
    it "should raise an error if the plane is already landed" do
      allow(plane).to receive(:landed).and_return(true)
      expect { subject.land(plane) }. to raise_error("Plane is already landed")
    end

    before do
      subject.land(plane)
    end
    it "should allow the plane to land and stay landed in the airport" do
      expect(subject.planes).to include(plane)
    end

    it "should raise an error if the aiport is full" do
      airport = Airport.new(0)
      expect { airport.land(plane) }.to raise_error("Airport full")
    end
  end

  describe "#take_off" do
    it "should raise an error if the plane is not in the aiport" do
      expect {subject.take_off(plane)}.to raise_error("Plane not in airport")
    end

    before do
      subject.land(plane)
      subject.take_off(plane)
    end
    it "should allow a plane to take off and leave the airport" do
      expect(subject.planes.include?(plane)).to eq false
    end
  end

end
