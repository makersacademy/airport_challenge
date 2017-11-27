require "./lib/airport"

describe Airport do
  # double(:weather, stormy?: false)
  it "allows a plane to land" do
    airport = Airport.new
    plane = double(:plane)
    weather = double(:weather)
    allow(weather).to receive(:stormy?).and_return(false)
    airport.land(plane, weather)
    expect(airport.planes_landed.count).to eq 1
  end

  it "allows a plane to take off and then removes it from the airport" do
    airport = Airport.new
    plane = double(:plane)
    weather = double(:weather)
    allow(weather).to receive(:stormy?).and_return(false)
    airport.land(plane, weather)
    airport.take_off(plane, weather)
    expect(airport.planes_landed.count).to eq 0
  end

  it "prevents a plane from taking off if the weather is stormy" do
    airport = Airport.new
    plane = double(:plane)
    weather = double(:weather)
    allow(weather).to receive(:stormy?).and_return(false)
    airport.land(plane, weather)
    allow(weather).to receive(:stormy?).and_return(true)
    expect { airport.take_off(plane, weather) }.to raise_error "weather is too stormy for take off"
  end

  it "prevents a plane from landing when weather is stormy" do
    airport = Airport.new
    plane = double(:plane)
    weather = double(:weather)
    allow(weather).to receive(:stormy?).and_return(true)
    expect {airport.land(plane, weather) }.to raise_error "weather is too stormy for the plane to land"
  end

  it "prevent planes from landing when the airport is full" do
    airport = Airport.new
    plane1 = double(:plane)
    weather = double(:weather, stormy?: false)
    Airport::DEFAULT_CAPACITY.times { airport.land(double(:plane), weather) }
    expect { airport.land(plane1, weather) }.to raise_error "cannot land plane due to full airport"
  end

  it "allows a default airport capacity that can be overridden as appropriate" do
    airport1 = Airport.new
    airport2 = Airport.new(30)
    expect { airport1 }.not_to raise_error
    expect { airport2 }.not_to raise_error
    expect(airport1.capacity).to eq 20
    expect(airport2.capacity).to eq 30
  end


end
