require './lib/airport'

describe Airport do
  it "reports what is in the hangar when asked" do
    airport = Airport.new
    expect(airport.hangar).to eq airport.hangar
  end

  it "can be full" do
    airport = Airport.new
    airport.capacity.times { Plane.new.land(airport) }
    expect(airport.full?).to be true
  end

  it "can be not full" do
    airport = Airport.new
    if airport.hangar.length < airport.capacity
      expect(airport.full?).to be false
    end
  end

end
