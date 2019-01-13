require "plane"

describe Plane do

  describe "#airborn" do

    it { is_expected.to respond_to(:airborn) }

    it "should change the flying attribute to true" do
      subject.airborn
      expect(subject.flying).to eq(true)
    end

  end

  describe "#grounded" do

    it { is_expected.to respond_to(:grounded) }

    it "should change the flying attribute to true" do
      subject.grounded
      expect(subject.flying).to eq(false)
    end

  end

end
