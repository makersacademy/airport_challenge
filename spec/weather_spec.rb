require_relative '../lib/weather.rb'

describe Weather do
  let(:weather) { Weather.new }
  
  it { is_expected.to respond_to(:stormy) }
  
  describe '#tells the weather condition' do
    it "is sunny" do
      allow(weather).to receive(:random_outlook).and_return(:fine)
      expect(weather.stormy).to eq false
    end
    
    it "is stormy" do
      allow(weather).to receive(:random_outlook).and_return(:stormy)
      expect(weather.stormy).to eq true
    end
  end  
end
