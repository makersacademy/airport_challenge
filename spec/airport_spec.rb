require "airport"

describe Airport do
  it "can land an airplane" do
    airplane = Airplane.new
    subject.land(airplane)
    expect(subject.get_airplanes).to eq([airplane])
    expect(airplane.landed?).to eq true
  end

  it "an airplane can take-off" do
    airplane = Airplane.new
    subject.land(airplane)
    subject.take_off(airplane)
    expect(subject.get_airplanes).to eq([])
    expect(airplane.landed?).to eq false
  end

  it "not possible to land airplane when full" do
    airplane = Airplane.new
    subject.land(airplane)
    airplane_two = Airplane.new
    subject.land(airplane_two)
    expect(subject.get_airplanes).to eq([airplane])
  end

  it "has a default capacity" do
    expect(subject.get_capacity).to eq(1)
  end

  it "is possible to override default capacity" do
    airport = Airport.new(10)
    expect(airport.get_capacity).to eq(10)
  end

  it "isn't possible to land when weather is stormy" do
    subject.set_weather("stormy")
    airplane = Airplane.new
    subject.land(airplane)
    expect(subject.get_airplanes).to eq([])
  end

  it "isn't possible to take-off when weather is stormy" do
    airplane = Airplane.new
    subject.land(airplane)
    subject.set_weather("stormy")
    subject.take_off(airplane)
    expect(subject.get_airplanes).to eq([airplane])
  end

  it "airplanes can't take-off from airport they're not in" do
    airplane = Airplane.new
    subject.land(airplane)
    airplane_two = Airplane.new
    expect { subject.take_off(airplane_two) }.to raise_error "Airplane not in airport"
  end

  it "airplanes cannot land at airport where they're already" do
    airplane = Airplane.new
    airport = Airport.new(5)
    airport.land(airplane)
    expect { airport.land(airplane) }.to raise_error "Airplane already in airport"
  end

  it "cannot land airplane if it's already landed at an airport" do
    airplane = Airplane.new
    airport = Airport.new(5)
    airport_two = Airport.new(5)
    airport.land(airplane)
    expect { airport_two.land(airplane) }.to raise_error "Airplane already landed in an airport"
  end

  it "is possible to land and take-off multiple airplanes" do
    heathrow = Airport.new(5)
    gatwick = Airport.new(5)
    lutton = Airport.new(5)
    
    tap = Airplane.new
    ba = Airplane.new
    emirates = Airplane.new
    easyjet = Airplane.new
    ryanair = Airplane.new

    heathrow.land(tap)
    heathrow.land(ba)
    heathrow.land(emirates)
    gatwick.land(easyjet)
    lutton.land(ryanair)

    heathrow.take_off(ba)
    heathrow.take_off(emirates)
    gatwick.take_off(easyjet)
    lutton.take_off(ryanair)

    heathrow.land(easyjet)
    heathrow.land(ryanair)
    gatwick.land(ba)

    heathrow.take_off(easyjet)
    gatwick.take_off(ba)

    heathrow.land(ba)
    gatwick.land(emirates)

    expect(heathrow.get_airplanes).to eq [tap, ryanair, ba]
    expect(gatwick.get_airplanes).to eq [emirates]
    expect(lutton.get_airplanes).to eq []
    expect(easyjet.landed?).to eq false
  end
end