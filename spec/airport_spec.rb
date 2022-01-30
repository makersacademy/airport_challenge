require_relative "../lib/airport"

describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe "#land" do
    it "instructs a plane to land" do
      expect(subject.land).to eq(true)
    end
  end

  describe "#take_off" do
    it "instructs a plane to take off" do
      expect(subject.take_off).to eq(true)
    end
  end

end
