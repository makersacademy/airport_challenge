require 'airport'

describe Airport do

  describe "#store(plane)" do
    it "stores a landed plane in the hangar" do
      expect(subject.store("plane")).to eq "plane is stored"
    end
  end

  describe "#hangar_storage_report" do
    it "provides a list of all the planes in the hangar" do
      subject.store("plane1")
      subject.store("plane2")
      expect(subject.hangar_storage_report).to include("plane1", "plane2")
    end
  end
  
end