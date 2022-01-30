require_relative "../lib/plane"

describe Plane do
  it { is_expected.to respond_to :ready_to_land? }
  it { is_expected.to respond_to :flying? }

  describe "#ready_to_land" do
    it "Is ready to land" do
      expect(subject.ready_to_land?).to eq(true)
    end
  end

  describe "#flying?" do
    it "confirms whether the plane is in flight" do
      expect(subject.flying?).to eq(true)
    end

    it ""
  end
end
