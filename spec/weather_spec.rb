require "Weather"
describe Weather do

  subject(:weather) { described_class.new }

  describe "#generate" do
    it "returns stomry" do
      allow(weather).to receive(:generate) { "Stormy" }
      expect(weather.generate).to eq "Stormy"
    end 

    it "returns sunny" do
      allow(weather).to receive(:generate) { "Sunny" }
      expect(weather.generate).to eq "Sunny"
    end
  end 
end
