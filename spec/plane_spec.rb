require './lib/plane.rb'
require './lib/airport.rb'

describe '' do
  
  it 'can land due to less flights' do
    plane = Plane.new

    expect(plane.land((Airport.new))).to eq("landed!")
  end

  it 'can land due to normal weather' do
    plane = Plane.new
    ap = Airport.new(1, "sunny")
  
    expect(plane.land(ap)).to eq("landed!")
  end
  
  it 'cannot land due to more flights' do
    plane = Plane.new
    ap = Airport.new(2, "njjnnjn")
    plane.land(ap)
    plane.land(ap)

    expect(plane.land(ap)).to eq("no landing for now!")
  end
  
  it 'cannot land due to stormy weather' do
    plane = Plane.new
    ap = Airport.new(3, "stormy")
    
    expect(plane.land(ap)).to eq("no landing for now!")
  end

  it 'can take-off' do
    plane = Plane.new
    ap = Airport.new
    plane.land(ap)

    expect(plane.take_off(ap)).to eq("took off! no longer in the airport")
  end

  it 'can take-off due to normal weather' do
    plane = Plane.new
    ap = Airport.new(1, "sunny")
    plane.land(ap)

    expect(plane.take_off(ap)).to eq("took off! no longer in the airport")
  end

  it 'cannot take-off due to no flights' do
    plane = Plane.new
    ap = Airport.new
    
    expect(plane.take_off(ap)).to eq("cannot take-off")
  end

  it 'cannot take-off due to stormy weather' do
    plane = Plane.new
    ap = Airport.new(2, "stormy")
    plane.land(ap)

    expect(plane.take_off(ap)).to eq("cannot take-off")
  end
  
end