require_relative "../lib/airport"

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to :take_off }

  describe "#land" do
    it "instructs a plane to land" do
      expect(subject.land("plane")).to eq(["plane"])
    end
  end

  describe "#take_off" do
    it "instructs a plane to take off" do
      planes = []
      planes << "plane"
      # planes.pop
      expect { subject.take_off }.to change(planes, :length).by(-1)
      # This works in irb but its shows a change by 0 in rspec
    end

    # it "Raise error if plane is already in flight" do
    #   expect{ subject.take_off }.to raise_error("This plane is already in flight")
    # end
     
  end

end
