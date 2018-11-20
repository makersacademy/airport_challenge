require 'airport'

describe Airport do

  let(:airport) { Airport.new }

  it "airport has a default capacity of 20" do
    expect(airport.capacity).to eq 20
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "airport cannot go over it's default capacity" do
    Airport::DEFAULT_CAPACITY.times { airport.hangar.push(Plane.new) }
    plane21 = Plane.new
    expect { plane21.land(airport) }.to raise_exception(Exception, "There's no room at the hangar.")
  end

end
