require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe "#land" do 
    it "responds to land with 1 arg" do 
      expect(subject).to respond_to(:land).with(1).arguments
    end

    it "can land a plane" do
      expect(subject.land(plane)).to eq plane
    end
  end
end