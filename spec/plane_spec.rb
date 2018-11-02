require 'plane'

describe Plane do
  let(:boeing) { Plane.new }
  let(:heathrow) { Airport.new }
  stormy = "stormy"
  clear = "clear"

  it "responds to #land with one argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "#takes_off from an airport" do
    expect(subject).to respond_to(:take_off)
  end

  it "should not be able to #land if it has already landed" do
    allow(heathrow).to receive (:weather) { clear }
    boeing.land(heathrow)
    expect { boeing.land(heathrow) }.to raise_error ("The plane has already landed")
  end

  it "should not be able to #take_off if it is flying" do
    expect { boeing.take_off }.to raise_error ("The plane is already in the air")
  end
end
