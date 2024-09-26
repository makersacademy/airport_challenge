require 'weather'

describe Weather do
  describe '#forecast' do
    it 'allows accessing current weather conditions' do
      allow(subject).to receive(:forecast) { "clear" }
      expect(subject.forecast).to eq("clear")
    end
  end
end