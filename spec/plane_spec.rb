require_relative "../lib/plane"

describe Plane do
  it { is_expected.to respond_to :ready_to_land? }

  describe "#ready_to_land" do
    it "Is ready to land" do
      expect(subject.ready_to_land?).to eq(true)
    end
  end
end
