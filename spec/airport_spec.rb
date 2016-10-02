require 'airport'
require 'plane'

describe Airport do

subject(:airport) {described_class.new}
let(:plane) {double :plane}

describe "#initialize" do
  context "the airtraffic controller set a capacity" do
    it "should allow the airtraffic controller to set a capacity" do
      airport.instance_variable_get("@capacity")
    end
  end

  context "use default capacity" do
    it "should use the default capacity of 50 unless stated" do
      expect(airport.capacity).to  eq 50
    end
  end
end

desribe '#land'

it "instructs the plane to land" do
  allow(plane).to receive(:land)
  airport.land(plane)
end

it "knows that the plane has landed" do
  allow(plane).to receive(:land)
  airport.land(plane)
  expect(airport.planes).to include plane

  airport.land(plane)
end

it "instructs a plane to take off" do
  allow(plane).to receive(:take_off)
  airport.take_off
end

  it "should instruct a plane to take off" do
     allow(plane).to receive(:take_off)
   end

   it "should prevent landing when the airport is full" do
     Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
     expect{airport.land(plane)}.to raise_error "Sorry, the airport is full so you cannot land"
   end
 end
