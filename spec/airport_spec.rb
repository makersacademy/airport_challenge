require 'Airport.rb'

describe Airport do

  let(:new_airport) { Airport.new("Hamburg") }
  let(:new_flight) { Plane.new("Lufthansa") }
  let(:new_flight2) { Plane.new("British Airways") }

  it 'airport can be named' do
    expect(new_airport.name).to eq("Hamburg")
  end

  it 'plane array empty' do
    expect(new_airport.planes_in_airport).to eq([])
  end

  it 'default airport capacity = 5' do
    expect(new_airport.capacity).to eq(5)
  end

  it 'capacity can be overriden to new value' do
    new_airport.capacity_override(8)
    expect(new_airport.capacity).to eq(8)
  end

  it 'if string given to capacity_override output error' do
    expect(new_airport.capacity_override("ten")).to eq("Capacity must be an integer")
  end

  it 'storm_landing shows option to user when there is a storm' do
    expect { new_airport.storm_landing(new_flight) }.to output("There is a storm. Do you want the plane to land yes or no:").to_stdout
  end

  it 'airport reponds to storm_decision' do
    expect(new_airport).to respond_to(:storm_decision)
  end

  # it 'check that if user input for storm decision is yes the plane is landed' do
  # new_airport.stub(:storm_decision) {"yes"}
  # expect(new_airport.planes_in_airport).to eq([new_flight.name])
  # end

  # it 'check that if user input for storm decision is no the plane doesnt land' do
  # new_airport.stub(:storm_decision) {"no"}
  # expect(new_airport.storm_landing(new_flight)).to eq("Lufthansa did not land.")
  # end

  # it 'check if plane is included in Airport' do
  # new_airport.stub(:storm_decision) {"no"}
  # expect(new_airport.storm_landing(new_flight)).to eq("Plane is already in the airport, cannot land")
  # end

  # it 'check that if user input for storm decision is yes the plane is landed' do
  #  allow(new_airport).to receive(:storm_decision).and_return("yes")
  #  expect(new_airport.planes_in_airport).to eq([new_flight.name])
  # end


  it 'check if plane included in airport' do
    expect(new_airport.plane_already_in_airport(new_flight)).to eq(false)
  end

  it 'check if plane landed is added to array' do
    new_airport.land_plane(new_flight)
    expect(new_airport.planes_in_airport).to eq([new_flight.name])
  end

  it 'check if plane in airport outputs "yes" when planes_already_in_airport method called' do
    new_airport.land_plane(new_flight)
    expect(new_airport.plane_already_in_airport(new_flight)).to eq(true)
  end

  it 'check if plane removed from airport' do
    new_airport.land_plane(new_flight)
    new_airport.take_off(new_flight)
    expect(new_airport.planes_in_airport).to eq([])
  end

  it 'if attempt is make to take off plane not in airport receive error' do
    expect(new_airport.take_off(new_flight)).to eq("Plane cannot take off as it is not in the airport")
  end

  it 'if capacity full plane cannot land' do
    new_airport.capacity_override(1)
    new_airport.land_plane(new_flight)
    expect(new_airport.planes_in_airport).to eq(["Lufthansa"])
    expect { new_airport.land_plane(new_flight2) }.to output("Airport full cannot land plane").to_stdout
  end

  it 'if plane already in airport cant land plane' do
    new_airport.land_plane(new_flight)
    expect { new_airport.land_plane(new_flight) }.to output("Cannot land plane as it is already in the airport").to_stdout
  end

end
