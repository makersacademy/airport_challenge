require 'weather_status'

describe Weather_status do
  let(:weather_status) { Weather_status.new }  
  
  describe "#stormy?" do
    it "can be not stormy" do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather_status.stormy?).to eq false
    end
  end
    it "can be stormy" do
      allow(Kernel).to receive(:rand).and_return 5
      expect(weather_status.stormy?).to eq true
    end
end