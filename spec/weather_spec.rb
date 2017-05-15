require 'weather'

describe Weather do
  describe "#sunny?" do
    before(:each) { @weather = described_class.new }
    it "Show the sunny? method will return false 15% of the time" do
      1000.times do
        Kernel.stub(:rand) { rand(85..100) }
        expect(@weather.sunny?).to eq false
      end
    end
    it "Show the sunny? method will return true 85% of the time" do
      1000.times do
        Kernel.stub(:rand) { rand(1...85) }
        expect(@weather.sunny?).to eq true
      end
    end
  end
end
