require_relative '../lib/Airport.rb'

describe Airport do
  it 'directs a plane to an airport' do
    lhr = Airport.new 
    flight0001 = Plane.new
    lhr.land(flight0001)
    expect(lhr.terminal[0]).to eq (flight0001)
  end
  it 'checks to see if plane is in airport (plane is in airport)' do
  lhr = Airport.new
  flight0001 = Plane.new
  lhr.land(flight0001)
  expect(lhr.search_plane(lhr,flight0001)).to eq true 
  end
  it 'checks for plane (plane isnt in airport)' do
    lhr = Airport.new
    flight0001 = Plane.new
    #lhr.land(flight0001)
    expect(lhr.search_plane(lhr,flight0001)).to eq false
  end
  it 'takes off a plane' do
    jfk = Airport.new
    flight0003 = Plane.new
    jfk.land(flight0003)
    expect(jfk.take_off(flight0003,jfk)).to eq ("#{flight0003} has taken off")
  end
  it 'makes sure the plane has "left the airport"' do
    jfk = Airport.new
    flight0003 = Plane.new
    jfk.land(flight0003)
    jfk.take_off(flight0003,jfk)
    expect(jfk.terminal.empty?).to eq true
  end
  it 'returns airport is full' do
    den = Airport.new
    10.times {den.land(Plane.new)}
    expect(den.airport_full).to eq true
  end
end

