require_relative "../lib/airport"

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to :take_off }

  describe "#land" do
    it "instructs a plane to land" do
      expect(subject.land("plane")).to eq("plane")
    end
  end

  describe "#take_off" do
    it "instructs a plane to take off" do
      expect(subject.take_off).to eq(true)
    end

    # it "Raise error if plane is already in flight" do
    #   expect{ subject.take_off }.to raise_error("This plane is already in flight")
    # end
     
  end

end
