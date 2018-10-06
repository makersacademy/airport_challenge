require 'weather'

describe Weather do
  describe "#stormy?" do
    it "should be true or false" do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
  end
end
