require_relative '../lib/airport'

describe Airport do
  subject(:Airport) {described_class.new}

  let(:plane) {double :plane}

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  describe "#land" do
    it "lands a plane and stores it in the array" do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe "#takeoff" do
    it "takes off a plane and removes it from the array" do
      subject.land(plane)
      subject.takeoff
      expect(subject.planes).to eq []
    end
  end


end
