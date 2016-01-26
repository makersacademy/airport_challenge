require 'airport'
require 'plane'
require 'weather'

describe "landing" do
  it "planes can land at airport" do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(plane.landed).to eq true
  end
end

describe "take off" do
  it "planes can take off from airport" do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(plane.landed).to_not eq true
  end
end

describe "multiple airports" do
  it "can't be in two places at once" do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    airport_1 = Airport.new
    airport_2 = Airport.new
    plane = Plane.new
    airport_1.land(plane)
    expect { airport_2.land(plane) }.to raise_error "This plane is already landed at another airport."
  end
end

describe "full airport" do
  it "can't have more planes" do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    airport = Airport.new
    10.times { airport.land(Plane.new) }
    expect {airport.land(Plane.new) }.to raise_error "This airport is full"
  end
end

describe "capacity" do
  before do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
  end

  it "has default capacity" do
    airport = Airport.new
    airport.capacity.times { airport.land(Plane.new) }
    expect {airport.land(Plane.new) }.to raise_error "This airport is full"
  end

  it "can have default capacity overwritten" do
    airport = Airport.new
    airport.capacity = 30
    airport.capacity.times { airport.land(Plane.new) }
    expect {airport.land(Plane.new) }.to raise_error "This airport is full"
  end
end

describe "weather dependency" do

  before do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
  end

  it "can't take off when stormy" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
    expect { airport.take_off(plane) }.to raise_error "Can't take off due to stormy weather"
  end

  it "can't land when stormy" do
    airport = Airport.new
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error "Can't land due to stormy weather"
  end
end



