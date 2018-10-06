require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:plane_2) { double(:plane) }

  describe "#hangar_report" do
    it "should be able to display a landed plane" do
      subject.landed_planes << plane
      expect(subject.hangar_report).to eq "Planes currently in the airport: #{[plane]}"
    end

    it "should be able to display multiple landed planes" do
      subject.landed_planes << plane
      subject.landed_planes << plane_2
      expect(subject.hangar_report).to eq "Planes currently in the airport: #{[plane, plane_2]}"
    end
  end

  describe "#weather" do
    it "should always be either 'sunny' or 'stormy'" do
      100.times { expect(subject.weather).to eq("sunny").or eq("stormy") }
    end
  end

  describe "#capacity" do
    it 'should have a default capacity of 20 planes' do
      expect(described_class::DEFAULT_CAPACITY).to eq 20
    end

    it 'should be able to override its default capacity' do
      expect(Airport.new(50).capacity).to eq 50
    end
  end

end
