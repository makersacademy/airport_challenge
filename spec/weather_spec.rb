require 'weather'

describe Weather do

  it { is_expected.to be_kind_of(described_class) }
  
    it 'Create ramdom weather generator' do
      expect(subject).to respond_to(:ramdom_weather_generator)
    end

    it 'Generates ramdom weather, Sunny or Stormy' do
      weather = Weather.new
      allow(weather.ramdom_weather_generator).to receive(:rand).and_return(3)
      expect(subject.ramdom_weather_generator).to eq "Sunny"
    end
end
