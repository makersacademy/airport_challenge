require 'Conditions'

describe Conditions do

  describe '#stormy' do
    it "returns true when conditions are stormy" do
      # expect the above airport to raise an error when it is stormy
      expect(subject.stormy).to eq true
    end
  end
end
