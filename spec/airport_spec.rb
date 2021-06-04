require "airport"

describe Airport do
  it "can land an airplane" do
    airplane = "airplane"
    subject.land(airplane)
    expect(subject.get_airplanes).to eq([airplane])
  end

  it "an airplane can take-off" do
    airplane = "airplane"
    subject.land(airplane)
    subject.take_off(airplane)
    expect(subject.get_airplanes).to eq([])
  end

  it "not possible to land airplane when full" do
    airplane = "airplane"
    subject.land(airplane)
    airplane_two = "airplane_two"
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
    airplane = "airplane"
    subject.land(airplane)
    expect(subject.get_airplanes).to eq([])
  end

  it "isn't possible to take-off when weather is stormy" do
    airplane = "airplane"
    subject.land(airplane)
    subject.set_weather("stormy")
    subject.take_off(airplane)
    expect(subject.get_airplanes).to eq([airplane])
  end

  it "airplanes can't take-off from airport they're not in" do
    airplane = "airplane"
    subject.land(airplane)
    airplane_two = "airplane_two"
    expect { subject.take_off(airplane_two) }.to raise_error "Airplane not in airport"
  end

  it "airplanes cannot land at airport where they're already" do
    airplane = "airplane55"
    airport = Airport.new(5)
    airport.land(airplane)
    expect { airport.land(airplane) }.to raise_error "Airplane already in airport"
  end
end