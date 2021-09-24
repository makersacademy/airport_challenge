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
  it 'checks if airport is full, (it is), prevents landing' do
    den = Airport.new
    10.times {den.land(Plane.new)}
    expect(den.land(Plane.new)).to eq ("Airport is full, cannot land")
  end
  it 'checks if aiport is full, (it isnt), permits landing' do
    den = Airport.new
    plane = Plane.new
    expect(den.land(plane)).to eq ([plane])
  end
  it 'allows overide of airport capacity' do
    lhr = Airport.new
    lhr.capacity = 15
    10.times{lhr.land(Plane.new)}
    plane = Plane.new
    expect(lhr.land(plane)).to eq (lhr.terminal)
    #This means that, after 10 planes have landed,another has been permitted to land (ie capacity increased)
  end
  it 'checks if weather is safe (yes)' do
    jfk = Airport.new
    expect(jfk.weather1(5)).to eq (true)
  end
  it 'checks if weather is safe (no)' do
    jfk = Airport.new 
    expect(jfk.weather1(6)).to eq (false)
  end
  it 'permits landing if weather is safe (yes)' do
    jfk = Airport.new
    plane = Plane.new
    weather = jfk.weather1(3)
    expect(jfk.land(plane)).to eq ([plane])
  end
  it 'prohibits take off if weather is bad' do
    jfk = Airport.new
    plane = Plane.new
    jfk.weather = 6 #weather overide for test
    expect(jfk.land(plane)).to eq ("Weather is bad")
    #normally when weather
  end

end

