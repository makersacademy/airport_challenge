require "airport"

describe Airport do
  it "Making an airport in the airport class." do
    airport = Airport.new()
  end

  it "tests the randomness of the weather conditions output." do
    airport = Airport.new()
    allow(airport).to receive(:rand) { 1 }
    expect(airport.weather_conditions).to eq "sunny"
  end

end
