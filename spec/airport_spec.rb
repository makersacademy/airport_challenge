require 'airport'

describe Airport do
  let(:plane) { double(:plane) }

  describe "#land" do
    it 'should be able to land a plane' do
      expect { subject.land(plane) }.not_to raise_error
    end
  end

  describe "#hangar_report" do
    it 'should be able to display a landed plane' do
      subject.land(plane)
      expect(subject.hangar_report).to eq "Planes currently in the airport: #{[plane]}"
    end
  end
end
