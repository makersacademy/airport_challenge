require 'airport'
require 'plane'

describe Airport do
  let(:boeing) { Plane.new }
  let(:heathrow) { Airport.new }
  stormy_warning = "Too stormy for this"
  stormy = "stormy"
  clear = "clear"

  it "#planes shows you what planes are at the airport" do
    allow(heathrow).to receive(:weather) { clear }
    boeing.land(heathrow)
    expect(heathrow.landed_planes).to include(boeing)
    boeing.take_off
    expect(heathrow.landed_planes).not_to include(boeing)
  end

  it "checks argument passed to capacity is a number" do
    expect(subject.capacity).to be_kind_of Numeric
  end

  it "prevents #landing if weather is stormy" do
    allow(heathrow).to receive(:weather) { stormy }
    expect { boeing.land(heathrow) && heathrow.weather == "stormy" }. to raise_error(stormy_warning)
  end

  it "prevents #take_off if weather is stormy" do
    allow(heathrow).to receive(:weather) { clear }
    boeing.land(heathrow)
    allow(heathrow).to receive(:weather) { stormy }
    expect { boeing.take_off && heathrow.weather == "stormy" }. to raise_error(stormy_warning)
  end

  it "should have default capacity that can be overriden " do
    expect(heathrow.capacity).to equal(5)
    heathrow.capacity = 3
    expect(heathrow.capacity).to equal(3)
  end

  it "will not allow you to land if the airport is full" do
    allow(heathrow).to receive(:weather) { clear }
    5.times { Plane.new.land(heathrow) }
    expect { boeing.land(heathrow) }.to raise_error("Can't land, airport is full")
  end

end
