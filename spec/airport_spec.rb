require 'airport'

describe Airport do

    it { is_expected.to be_a(Airport) }

  describe "#land" do

    it "should add plane to airport array" do
      plane = Plane.new
      expect(subject.land(plane)).to eq([plane])
    end

    it "Should return error if weather is bad" do
      plane = Plane.new
      expect{subject.land(plane)}.to raise_error("Bad weather")
    end

    it "should initialize with a capacity of 20" do
      expect(subject.capacity).to eq(Airport::CAPACITY)
    end

  end
end
