require_relative '../lib/plane'

describe Plane do
  subject(:Plane) {described_class.new}

  describe "#status" do
    it "returns the status of the plane" do
      allow(subject).to receive(:status).and_return("landed")
      expect(subject.status).to eq "landed"
    end
  end
end
