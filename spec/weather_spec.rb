require 'weather.rb'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  describe "#stormy?" do
    it "returns true or false using a random number generator" do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end
end
