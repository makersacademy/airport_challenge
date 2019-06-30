require 'airport'

describe Airport do

  describe "#store(plane)" do
    it "stores a landed plane in the hangar" do
      expect(subject.store("plane1")).to eq "plane1 is stored"
    end
  end

  describe "#release(plane)" do
    it "releases the plane from the hangar" do
      expect(subject.release("plane1")).to eq "plane1 is released"
    end
  end


  describe "#hangar_storage_report" do
    context "two planes have landed and none taken off" do
      it "provides a list of all the planes in the hangar" do
        subject.store("plane1")
        subject.store("plane2")
        expect(subject.hangar_storage_report).to include("plane1", "plane2")
      end
    end

    context "three planes have landed and one taken off" do
      it "provides a list of all the planes in the hangar" do
        subject.store("plane1")
        subject.store("plane2")
        subject.store("plane3")
        subject.release("plane2")
        expect(subject.hangar_storage_report).to include("plane1", "plane3")
      end
    end
  end

  describe "#hangar_plane_count" do
    context "two planes have landed and none taken off" do
      it "provides the number of planes in the hangar" do
        subject.store("plane1")
        subject.store("plane2")
        expect(subject.hangar_plane_count).to eq(2)
      end
    end
  end

  
end