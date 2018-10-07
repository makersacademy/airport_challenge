require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:plane_2) { double(:plane) }

  describe "#hangar_report" do
    it "should be able to display a landed plane" do
      subject.landed_planes << plane
      expect(subject.hangar_report).to eq "Planes currently in the hangar: #{[plane]}"
    end

    it "should be able to display multiple landed planes" do
      subject.landed_planes << plane
      subject.landed_planes << plane_2
      expect(subject.hangar_report).to eq "Planes currently in the hangar: #{[plane, plane_2]}"
    end
  end
  
  describe "#capacity" do
    it "should have a default capacity of 20 planes" do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it "should be able to override its default capacity" do
      expect(Airport.new(50).capacity).to eq 50
    end
  end

end
