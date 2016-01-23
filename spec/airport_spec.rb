require_relative '../lib/airport'

describe Airport do
  subject(:Airport) {described_class.new}

  let(:plane) {double :plane}

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  describe "#land" do
    it "lands planes" do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end


end
