require 'weather'

describe Weather do

  it 'provides the weather from a few different options' do
    my_airport = Airport.new
    expect(my_airport.weather.weather_today).to eq(:stormy).or(eq(:sunny))
  end

  it "returns true if the weather is stormy" do

    my_airport = Airport.new
    allow(my_airport.weather).to receive(:weather_today) { :sunny }
    expect(my_airport.weather.stormy?).to eq false
  end
end
