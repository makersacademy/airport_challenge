require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  describe "#condition" do
    it "returns sunny or stormy when called" do
      expect(weather.condition).to satisfy {|s| ["sunny", "stormy"].include?(s)}
    end
  end
end