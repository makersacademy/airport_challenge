require "weather"

describe Weather do
  context "method" do
    it "#is_stormy?" do
      expect(subject.is_stormy?).to eq(true).or eq(false)
    end
  end
end