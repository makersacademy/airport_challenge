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
      it "returns true" do
        expect(subject.flying?).to be true
      end
    end
  end
  
  describe "#land_at" do
    it "changes flying? to be false" do
      subject.depart_from(Airport.new)
      expect { subject.land_at(Airport.new) }
      .to change(subject, :flying?).to be false
    end
  end
  
  describe "#depart_from" do
    it "changes flying? to be true" do
      expect { subject.depart_from(Airport.new) }
      .to change(subject, :flying?).to be true
    end
  end
end