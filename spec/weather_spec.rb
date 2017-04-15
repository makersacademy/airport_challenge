require "weather"

describe Weather do
  describe ".new" do
    it "should be an instance of the Weather class" do
      expect(subject).to be_an_instance_of Weather
    end
  end
end
