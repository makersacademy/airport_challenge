require 'plane'
describe Plane do

  it 'expects plane to be airborne' do
    plane1 = Plane.new("Air Force One")
    expect(plane1.status == 'airborne').to eq true
  end

  it 'expects to land in airport' do
    plane1 = Plane.new("Air Force One")
    airport1 = Airport.new("JFK Airport")
    plane1.land(airport1)
    expect(plane1.status == 'grounded').to eq true
  end

  it 'expects to take off from airport' do
    plane1 = Plane.new("Air Force One")
    airport1 = Airport.new("JFK Airport")
    plane1.land(airport1)
    plane1.take_off(airport1)
    expect(plane1.status == 'airborne').to eq true
    expect(airport1.planes == []).to eq true
  end

end
