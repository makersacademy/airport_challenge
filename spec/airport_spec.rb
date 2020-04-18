require 'airport'

describe Airport do
  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  
  describe "#planes" do
    it "returns an Array" do
      expect(subject.planes).to be_a_kind_of(Array)
    end
  end
end