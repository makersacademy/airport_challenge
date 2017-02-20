require 'plane'

describe Plane do
  #checks that plane has entered the airport and is no longer flying
  it "land a plane", :planeland do
    airport = Airport.new
    set_stormy(false)
    subject.land(airport)

    check_landed(airport)
  end

  #checks that plane has left the airport and is now flying
  it "takeoff a plane", :planetakeoff do
    airport = Airport.new
    start_at_airport(airport)
    subject.takeoff(airport)

    check_flying
  end

  it "stops plane from landing when stormy", :stormyland do
    airport = Airport.new
    set_stormy(true)

    expect{subject.land(airport)}.to raise_error "The weather is too bad to land."
    check_flying
  end

  it "stops plane from taking off when stormy", :stormytakeoff do
    airport = Airport.new
    start_at_airport(airport)
    set_stormy(true)

    expect{subject.takeoff(airport)}.to raise_error "The weather is too bad to takeoff."
    check_landed(airport)
  end

  it "stop a landing at full airport", :planefullairport do
    airport = Airport.new
    fill_airport(airport, 10)
    set_stormy(false)

    expect{subject.land(airport)}.to raise_error "The hangar is full."
    check_flying
  end

  def check_flying #method to check that plane has left airport and is flying
    expect(subject.flying).to eq true
    expect(subject.airport).to eq nil
  end

  def check_landed(airport) #method to check that plane has landed in airport
    expect(subject.flying).to eq false
    expect(subject.airport).to eq airport
  end

  def start_at_airport(airport) #method to start planes at airport
    set_stormy(false)
    subject.land(airport)
  end

  def fill_airport(airport, planes) #method to automatically fill airport on testing
    count = 0
    until count==planes
      plane = Plane.new
      allow(plane.weather).to receive(:stormy?).and_return false
      plane.land(airport)
      count+=1
    end
  end

  def set_stormy(boolean) #overrides random weather
    allow(subject.weather).to receive(:stormy?).and_return boolean
  end
end
