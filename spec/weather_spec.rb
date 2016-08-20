require 'weather'

describe Weather do

  describe "#generate_weather(weather_chance)" do

    it 'generates sunny weather' do
      #subject.stub(:weather_chance) { 80 }
      allow(subject).to receive(:weather_chance).and_return(80)
      expect(subject.generate_weather(subject.weather_chance)).to eq("Sunny")
    end

    it 'generates stormy weather' do
      allow(subject).to receive(:weather_chance).and_return(81)
      expect(subject.generate_weather(subject.weather_chance)).to eq("Stormy")
    end

    it 'generates no weather' do
      allow(subject).to receive(:weather_chance).and_return(0)
      expect(subject.generate_weather(subject.weather_chance)).to eq("Stormy")
    end

  end

end
