require 'weather'

describe Weather do
  
  it "returns false if the weather is sunny" do

    my_airport = Airport.new
    allow(my_airport.weather).to receive(:weather_today) { :sunny }
    expect(my_airport.weather.stormy?).to eq false
  end
end
