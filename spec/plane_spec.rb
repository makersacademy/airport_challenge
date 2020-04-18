require 'plane'

describe Plane do
  
  it { is_expected.to respond_to(:land_at).with(1).argument }
  it { is_expected.to respond_to(:flying?) }
  it { is_expected.to respond_to(:depart_from).with(1).argument }
  
  describe "#flying?" do
    it "returns a bool" do
      expect(subject.flying?).to be(true).or be(false)
    end
    
    context "when first created" do
      it "returns false" do
        expect(subject.flying?).to be false
      end
    end
  end
  
  describe "#land_at" do
    
  end
  
  describe "#depart_from" do
  end
end