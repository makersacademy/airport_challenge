require './lib/airport'

describe Airport do
  it 'can host a plane' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.planes).to include(plane)
  end
end

describe Airport do
  it 'can say farewell to an airplane' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.planes).not_to include(plane)
  end
end

describe Airport do
  it 'can check if the plane is gone' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.gone?(plane)).to be false
  end
end

describe Airport do
  it 'can check if airport is full and refuse landing plane' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect (airport.full?).to be true
  end
  end
