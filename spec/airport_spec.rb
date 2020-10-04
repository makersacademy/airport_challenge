require 'Airport.rb'
describe Airport do
let(:new_airport) {Airport.new("Hamburg")}
let(:new_flight) {Plane.new("Lufthansa")}

  it 'airport can be named' do
    expect(new_airport.name).to eq("Hamburg")
  end

  it 'plane array empty' do
    expect(new_airport.planes_in_airport).to eq([])
  end

  it 'default airport capacity = 5' do
    expect(new_airport.capacity).to eq(5)
  end

  it 'airport reponds to capacity_override method' do
    expect(new_airport).to respond_to(:capacity_override)
  end

  it 'airport responds to capacity_override with argument' do
    expect(new_airport).to respond_to(:capacity_override).with(1).argument
  end

  it 'capacity can be overriden to new value' do
    new_airport.capacity_override(8)
    expect(new_airport.capacity).to eq(8)
  end

  it 'if string given to capacity_override output error' do
    expect(new_airport.capacity_override("ten")).to eq("Capacity not updated.  Method only accepts integers.  Please retry")
  end

  it 'airport responds to land_plane method' do
    expect(new_airport).to respond_to(:land_plane)
  end

  it 'airport responds to land_plane with two arguments' do
    expect(new_airport).to respond_to(:land_plane).with(1).arguments
  end

  it 'airport responds to storm_landing method' do
    expect(new_airport).to respond_to(:storm_landing)
  end

  it 'airport responds to storm_landing with one argument' do
    expect(new_airport).to respond_to(:storm_landing).with(1).argument
  end

  it 'storm_landing shows option to user when there is a storm' do
    expect{new_airport.storm_landing(new_flight)}.to output("There is a storm. Do you want the plane to land yes or no:").to_stdout
  end

  it 'airport reponds to storm_decision' do
    expect(new_airport).to respond_to(:storm_decision)
  end

  #it 'check that if user input for storm decision is yes the plane is landed' do
    #new_airport.stub(:storm_decision) {"yes"}
    #expect(new_airport.planes_in_airport).to eq([new_flight.name])
  #end

  #it 'check that if user input for storm decision is no the plane doesnt land' do
  #  new_airport.stub(:storm_decision) {"no"}
  #  expect(new_airport.storm_landing(new_flight)).to eq("Lufthansa did not land.")
  #end

  #it 'check if plane is included in Airport' do
  #  new_airport.stub(:storm_decision) {"no"}
  #  expect(new_airport.storm_landing(new_flight)).to eq("Plane is already in the airport, cannot land")
  #end

  #it 'check that if user input for storm decision is yes the plane is landed' do
  #  allow(new_airport).to receive(:storm_decision).and_return("yes")
  #  expect(new_airport.planes_in_airport).to eq([new_flight.name])
  #end

  it 'airport reponds to plane_already_in_airport?' do
    expect(new_airport).to respond_to(:plane_already_in_airport)
  end

  it 'airport responds to storm_landing with one argument' do
    expect(new_airport).to respond_to(:plane_already_in_airport).with(1).argument
  end

  it 'check if plane included in airport' do
    expect(new_airport.plane_already_in_airport(new_flight)).to eq("No")
  end

  it 'check if plane landed is added to array' do
    new_airport.land_plane(new_flight)
    expect(new_airport.planes_in_airport).to eq([new_flight.name])
  end

  it 'check if plane in airport outputs "yes" when planes_already_in_airport method called' do
    new_airport.land_plane(new_flight)
    expect(new_airport.plane_already_in_airport(new_flight)).to eq("Yes")
  end

  it 'airport responds to take_off method' do
    expect(new_airport).to respond_to(:take_off)
  end

  it 'airport responds to storm_landing with one argument' do
    expect(new_airport).to respond_to(:take_off).with(1).argument
  end

  it 'check if plane removed from airport' do
    new_airport.land_plane(new_flight)
    new_airport.take_off(new_flight)
    expect(new_airport.planes_in_airport).to eq([])
  end

end
