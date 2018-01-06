require "weather"

describe Weather do

  describe "#stormy?" do
    it "should set the weather stormy status to either true or false" do
      expect(subject.stormy?).to eq(true).or(eq(false))
    end
  end

end
