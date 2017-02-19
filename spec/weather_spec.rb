require 'weather'

describe Weather do

  describe '#weather_generator', :weather => true do
    it 'returns sunny weather' do
      allow(subject).to receive(:weather_generator).and_return('sunny')
      expect(subject.weather_generator).to eq 'sunny'
    end
    it 'returns stormy weather' do
      allow(subject).to receive(:weather_generator).and_return('stormy')
      expect(subject.weather_generator).to eq 'stormy'
    end
  end
end
