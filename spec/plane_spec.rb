require 'plane'

describe Plane do

  def airport_that_allows_landing
    airport = double(:airport)
    allow(airport).to receive(:request_to_land).and_return(true)
    airport
  end

  def airport_that_allows_take_off
    airport = double(:airport)
    allow(airport).to receive(:request_take_off).and_return(true)
    airport
  end

  it "should land at an airport" do
    plane = Plane.new
    airport = airport_that_allows_landing
    plane.land(airport)
    expect(plane.airport).to eq airport
  end

  it "should confirm it's landed" do
    plane = Plane.new
    airport = airport_that_allows_landing
    expect(plane.land(airport)).to eq true
  end

  it "should take off from an airport" do
    airport = airport_that_allows_take_off
    plane = Plane.new(airport)
    plane.take_off(airport)
    expect(plane.airport).to eq nil
  end

  it "should confirm it took off" do
    airport = airport_that_allows_take_off
    plane = Plane.new(airport)
    expect(plane.take_off(airport)).to eq true
  end

  it "should not land when airport doesn't give permission to land" do
    plane = Plane.new
    airport = double(:airport)
    allow(airport).to receive(:request_to_land).and_return(false)
    plane.land(airport)
    expect(plane.airport).to eq nil
  end

  it "should no take off when airport doesn't give permission to take off" do
    airport = double(:airport)
    plane = Plane.new(airport)
    allow(airport).to receive(:request_take_off).and_return(false)
    plane.take_off(airport)
    expect(plane.airport).to eq airport
  end

  it "should raise an error if the airport it's taking off is wrong" do
    gatwick = double(:airport)
    heathrow = double(:airport)
    plane = Plane.new(gatwick)
    allow(heathrow).to receive(:request_take_off).and_return(true)
    expect { plane.take_off(heathrow) }.to raise_error "The plane is in another airport!"
  end

  it "should raise an error when a plane is instructed to land, but it's alredy landed" do
    airport = double(:airport)
    plane = Plane.new(airport_that_allows_landing)
    expect { plane.land(airport_that_allows_landing) }.to raise_error "The plane has already landed!"
  end

end
