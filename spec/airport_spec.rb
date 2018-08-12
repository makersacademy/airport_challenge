require "airport"

describe Airport do
  let(:cap)         { 30 }
  let(:sub2)        { Airport.new(cap) }

  context "when first initialized" do
    it { is_expected.not_to eql(nil) }
    it "takes 1 argument" do
      expect(Airport).to respond_to(:new).with(1).arguments
    end
    it "accepts 0 arguments" do
      expect(Airport).to respond_to(:new).with(0).arguments
    end

    describe ".hanger" do
      it "creates an empty array" do
        expect(subject.hanger).to eq []
      end
    end

    describe ".capacity" do
      it "defaults to 20" do
        expect(subject.capacity).to eq 20
      end
      it "is assigned to the first argument" do
        expect(sub2.capacity).to eq 30
      end
    end
  end

  describe "#full?" do
    it "returns true if hanger is at max capacity" do
      20.times { subject.hanger << "plane" }
      expect(subject.full?).to eq true
    end
  end

  describe "#empty?" do
    it "returns true if hanger is empty" do
      expect(subject.hanger.empty?).to eq true
    end
  end

  describe "#good_weather?" do
    it "returns true or false" do
      expect(subject.good_weather?).to eq(true).or eq(false)
    end
  end
end
