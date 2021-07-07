require 'atc'
require 'aircraft'
require 'airport'
require 'weather'

describe Atc do
  it 'lands an aircraft at Heathrow. Feature test.' do
    srand 500
    a777 = Aircraft.new("in flight", "none", "G-RAES")
    heathrow = Airport.new("LHR")
    expect(subject.auth_landing(a777, heathrow, "LHR")).to be true
  end
  it 'takes off an aircraft off from Dublin. Feature test' do
    srand 500
    a330 = Aircraft.new("in flight", "none", "EI-GAJ")
    dublin = Airport.new("DUB")
    subject.auth_landing(a330, dublin, "DUB")
    expect(subject.auth_takeoff(a330, dublin, "DUB")).to be true
  end
  it "checks that aircraft cannot be landed in poor weather. Feature Test" do
    srand 5
    swanwick = Atc.new
    a777 = Aircraft.new("in flight", "none", "G-RAES")
    heathrow = Airport.new("LHR")
    expect { swanwick.auth_landing(a777, heathrow, "LHR") }.to raise_error("Poor weather. Airport closed.")
  end
  it "checks that aircraft cannot takeoff in poor weather. Feature Test" do
    srand 500
    swanwick = Atc.new
    a777 = Aircraft.new("in flight", "none", "G-RAES")
    heathrow = Airport.new("LHR")
    swanwick.auth_landing(a777, heathrow, "LHR")
    srand 5
    expect { swanwick.auth_takeoff(a777, heathrow, "LHR") }.to raise_error("Poor weather. Airport closed.")
  end
end
