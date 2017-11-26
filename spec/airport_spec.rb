require "./lib/airport"

describe Airport do
  it "allows a plane to land" do
    airport = Airport.new
    plane = double(:plane)
    airport.land(plane)
    expect(airport.planes_landed.count).to eq 1
  end

  it "allows a plane to take off and then removes it from the airport" do
    airport = Airport.new
    plane = double(:plane)
    weather = double(:weather)
    airport.land(plane)
    allow(weather).to receive(:stormy?).and_return(false)
    airport.take_off(plane, weather)
    expect(airport.planes_landed.count).to eq 0
  end

  it "prevents a plane from taking off if the weather is stormy" do
    airport = Airport.new
    plane = double(:plane)
    weather = double(:weather)
    airport.land(plane)
    allow(weather).to receive(:stormy?).and_return(true)
    expect{airport.take_off(plane, weather)}.to raise_error "weather is too stormy for take off"
  end
end
