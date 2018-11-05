require 'airport'

describe Airport do
  it "airport has a weather variable that can be good" do
    airport = Airport.new
    expect(airport.weather).to eq 'good'
  end

  it "airport has a weather vaiable that can be stormy" do
    airport = Airport.new
    airport.storm
    expect(airport.storm).to eq 'storm'
  end

  it "airport has a default capacity of 20" do
    airport = Airport.new()
    expect(airport.capacity).to eq 20
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "airport cannot go over it's default capacity" do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times { airport.hangar.push(Plane.new) }
    plane21 = Plane.new
    expect { plane21.land(airport) }.to raise_exception(Exception, "There's no room at the hangar.")
  end

end
