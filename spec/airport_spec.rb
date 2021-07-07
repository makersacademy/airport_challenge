require 'airport'
require 'aircraft'

describe Airport do
  it 'lands a plane - into array. Unit test' do
    heathrow = Airport.new "LHR"
    b747 = Aircraft.new("in flight")
    expect(heathrow.aircraft_arriving(b747)).to be true
  end
  it 'departs a plane - out of array. Unit test' do
    heathrow = Airport.new "LHR"
    b747 = Aircraft.new("landed", "LHR", "G-BNLO")
    heathrow.aircraft_arriving(b747)
    test_plane = heathrow.aircraft_departing("G-BNLO")
    expect(test_plane.registration).to eq "G-BNLO"
  end
  it "throws an error if we ask for a plane not at the airport. Unit test" do
    heathrow = Airport.new "LHR"
    b747 = Aircraft.new("landed", "LHR", "G-BNLO")
    heathrow.aircraft_arriving(b747)
    expect { heathrow.aircraft_departing("G-YMMM") }.to raise_error "G-YMMM not present at LHR. Cannot takeoff."
  end
  it "throws an error if we try to land a plane when the airport is full." do
    heathrow = Airport.new "LHR"
    b747 = Aircraft.new("landed", "LHR")
    20.times { heathrow.aircraft_arriving(b747) }
# We will set airport capacity to 20.
# Expecting an error when we try to land the 21st.
    expect { heathrow.aircraft_arriving(b747) }.to raise_error \
    "Airport is full.  Permission to land denied."
  end
end
