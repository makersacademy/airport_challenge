require 'weather'

describe Weather do

  it 'provides the weather from a few different options' do
    my_airport = Airport.new
    expect(my_airport.send(:weather).send(:weather_today)).to eq(:stormy).or(eq(:sunny))
  end

  it "returns false if the weather is sunny" do

    my_airport = Airport.new
    allow(my_airport.send(:weather)).to receive(:weather_today) { :sunny }
    expect(my_airport.send(:weather).stormy?).to eq false
  end
end
