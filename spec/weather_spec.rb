require 'weather'

describe Weather do
  let(:weather) { double :weather }
  describe '#weather' do
    it "should check if stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect(weather.stormy?).to eq true
    end
  end
end
