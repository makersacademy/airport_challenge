require "plane"

describe Plane do
  describe "#land" do
    it { is_expected.to respond_to :land }
  end

  it "lands at the specified destination" do
    airliner1 = Plane.new
    airliner1.land("Tokyo")
    expect(airliner1.landed).to be(true)
    expect(airliner1.location).to eq("Tokyo")
  end
end
