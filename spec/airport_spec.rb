require 'airport'
require 'pry'

describe Airport do
  let(:airport) {subject}
  before { airport.weather = "sunny" }

  it "tracks number of planes in airport with #full?" do
    airport.weather = "sunny"
    airport.capacity.times { Plane.new.land(airport) }
    expect(airport).to be_full
  end

  it "has a default capacity of 5" do
    5.times { Plane.new.land(airport) }
    expect { Plane.new.land(airport) }.to raise_error("Airport is full!")
  end

  it "can be given a new capacity" do
    airport.capacity = 10
    10.times { Plane.new.land(airport) }
    expect { Plane.new.land(airport) }.to raise_error("Airport is full!")
  end


  it "has weather" do
    expect(airport.weather).not_to be_nil
  end
end
