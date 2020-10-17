require "plane"

describe Plane do
  describe "#name" do
    it "checks it has a name" do
      expect(subject).to respond_to(:name)
    end
  end
  
  describe "#status" do
    it "responds to status" do
      expect(subject).to respond_to(:status)
    end
    it "responds 'flying' or 'landed'" do
      expect(subject.status).to include("flying").or include("landed")
    end

    context "is in the air" do
      it "mocks flying" do
        subject.status = "flying"
        expect(subject.status).to eq "flying"
      end
    end
    context "is landed" do
      it "mocks being on the ground" do
        subject.status = "landed"
        expect(subject.status).to eq "landed"
      end
    end
  end
end
