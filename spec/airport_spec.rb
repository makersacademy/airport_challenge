require "airport"

describe Airport do
  subject(:airport) {described_class.new}
  plane = Plane.new

  #1 - User Story 1
  it "1. checks existance of the class Airport" do
    expect(airport.class).to eq Airport
  end

  #2 - User Story 1
  it "2. plane can land at airport - land method" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  #3 - User Story 1
  it "3. confirmation message that the plane has landed" do
  expect(airport.land(plane)).to eq "The plane has landed"
  end

  #4 - User Story 5
  it "4. raises an error if plane attempts to land and no gates are available" do
    airport_size5 = Airport.new(5,false)
    5.times do
      airport_size5.land(Plane.new)
    end
    expect{airport_size5.land(Plane.new)}.to raise_error "No gates available - cannot land plane"
  end

  #5 - User Story 2
  it "5. a plane can depart from the airport - take_off method" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  #6 - User Story 2
  it "6. confirmation message that the plane has departed" do
    airport.land(plane) # land a plane first
    allow(airport).to receive(:stormy_weather).and_return false
    expect(airport.take_off(plane)).to eq "The plane has departed"
  end

  #7 - User Story 2
  it "7. raises an error when there are no planes to depart for take_off method" do
    allow(airport).to receive(:stormy_weather).and_return(false)
    expect{airport.take_off(plane)}. to raise_error "There are no planes currently at the airport - No departures"
  end

  #8 - User Story 6
  it "8. defaults to 231 gates if no argument is given" do
    expect(airport.gates_size).to eq Airport::AIRPORT_CAPACITY
  end

  #9 - User Story 6
  it "9. airport capacity can be passed as an argument" do
    airport_capacity_5 = Airport.new(5,false)
    expect(airport_capacity_5.gates_size).to eq 5
  end

  #10 - User Story 3
  it "10. raises and error when the weather is stormy and plane attempts to takeoff" do
    airport.land(plane)
    allow(airport).to receive(:stormy_weather).and_return(true)
    expect{airport.take_off(plane)}.to raise_error "The weather is stormy, plane cannot takeoff"
  end

  #11 - User Story 3
  it "11. does not raise an error wwhen the weather is not stormy and plane attempts to takeoff" do
    airport.land(plane)
    allow(airport).to receive(:stormy_weather).and_return(false)
    expect{airport.take_off(plane)}.not_to raise_error
  end

end
