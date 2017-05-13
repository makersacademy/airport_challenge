require 'weather'

describe Weather do
  subject(:weather_today) { Weather.new }
  xit { is_expected.to respond_to :weather_generator }

  xit "is sunny weather" do
    expect(weather_today.weather_generator).to eq :sunny
  end

  xit "is stormy weather" do
    expect(weather_today.weather_generator).to eq :stormy
  end
end
