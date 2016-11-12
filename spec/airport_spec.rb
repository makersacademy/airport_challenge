require "airport"
require "plane"

describe Airport do
  
  let(:plane){ double :plane }

  describe "#land_plane" do
    it {is_expected.to respond_to :land}
    it "should return truthy answer when a plane landed" do
      expect(subject.land(plane)).to be_truthy
    end
  end

  describe "#confirm_landed" do
    it { is_expected.to respond_to :confirm_landed }
    it "should return truthy answer when plane has landed" do
      subject.land(plane)
      expect(subject.confirm_landed(plane)).to be_truthy
    end
    it "should return error when plane hasn't landed" do
      expect{ subject.confirm_landed(plane) }.to raise_error("No plane landed!")
    end
  end

end
