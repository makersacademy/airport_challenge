require 'weather'

describe Weather do
 before(:each) {allow(Random).to receive(:rand).and_return(0)}
  describe '#weather_check returns the weather' do
    it 'checks the weather' do
      expect(subject.weather_check).to eq :stormy
    end

    it 'initializes with the current weather' do
      expect(subject.current_weather).to eq :stormy
    end
  end
end