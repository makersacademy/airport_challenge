require "airport"
require "plane"

describe Airport do

  let(:plane1){ double :plane1 }
  let(:plane2){ double :plane2 }

  describe "#land" do
    it { is_expected.to respond_to :land }
    it "should return truthy answer when plane lands" do
      expect( subject.land(plane1) ).to be_truthy
    end
  end

  describe "#confirm_landed" do
    it { is_expected.to respond_to :confirm_landed }
    it "should return truthy answer when plane has landed" do
      subject.land(plane1)
      expect( subject.confirm_landed(plane1) ).to be_truthy
    end
    it "should return falsy answer when plane hasn't landed" do
      expect( subject.confirm_landed(plane1) ).to be_falsy
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to :take_off }
    it "should return truthy answer when plane takes off" do
      subject.land(plane1)
      expect( subject.take_off(plane1) ). to be_truthy
    end
    it "should return error when the plane hasn't landed before taking off" do
      subject.land(plane1)
      expect{ subject.take_off(plane2) }.to raise_error("This plane hasn't landed at this airport!")
    end
    it "should not exist the plane at airport after taking off" do
      subject.land(plane1)
      subject.take_off(plane1)
      expect( subject.confirm_landed(plane1) ).to be_falsy
    end
  end

end
