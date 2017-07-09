require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  plane1 = Plane.new
  plane2 = Plane.new

  it 'allows a plane to land' do
    expect(airport.land(plane1)).to eq [plane1]
  end

  it 'shows planes in airport' do
    airport.land(plane1)
    airport.land(plane2)
    expect(airport.planes).to eq [plane1, plane2]
  end

  it 'checks if a plane has landed' do
    airport.land(plane1)
    expect(airport.in_airport?(plane1)).to be_truthy
    expect(airport.in_airport?(plane2)).to be_falsy
  end

  it 'shows plane is no longer in airport after takeoff' do
    airport.planes = [plane1, plane2]
    airport.takeoff(plane1)
    expect(airport.in_airport?(plane1)).to be_falsy
    expect(airport.in_airport?(plane2)).to be_truthy
  end

  it "cannot takeoff if it is stormy" do
    airport.planes = [plane1]
    airport.weather = "stormy"
    expect(airport.takeoff(plane1)).to eq "cannot takeoff due to weather"
    expect(airport.in_airport?(plane1)).to be_truthy
  end

  it "can takeoff if it is sunny" do
    airport.planes = [plane1]
    airport.weather = "sunny"
    airport.takeoff(plane1)
    expect(airport.in_airport?(plane1)).to be_falsy
  end

end
