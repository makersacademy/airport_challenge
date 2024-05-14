require 'aircraft'

describe Aircraft do
  it 'lands at the airport. Unit test' do
    a320 = Aircraft.new("in flight")
    expect(a320.land_aircraft("LHR")).to be true
  end
  it 'receives an error if trying to land an aircraft already landed. Unit test.' do
    expect { subject.land_aircraft("LHR") }.to raise_error("aircraft landed - cannot land again")
  end
  it 'takes off from an airport. Unit test.' do
    a320 = Aircraft.new("landed", "LHR")
    a320.takeoff("LHR")
    expect(a320.status).to eq "in flight"
    expect(a320.airport).to eq ""
  end
  it "throws an error if we ask the aircraft to depart from an airport they are not at. Unit test." do
    a320 = Aircraft.new("landed", "DUB")
    expect { a320.takeoff("LHR") }.to raise_error("Cannot takeoff from LHR. Currently at DUB.")
  end
  it "throws an error if we ask an in-flight aircraft to takeoff. Unit test." do
    a320 = Aircraft.new("in flight", "")
    expect { a320.takeoff("") }.to raise_error("Already in flight. Cannot takeoff.")
  end
  it "throws an error if don't specify which airport we are landing at. \
  Unit test" do
    a320 = Aircraft.new("in flight")
    expect { a320.land_aircraft }.to raise_error("need to specify airport to land")
  end
end
