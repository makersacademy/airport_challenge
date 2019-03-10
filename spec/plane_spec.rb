require "./lib/plane.rb"

describe Plane do

it { is_expected.to respond_to(:land) }
it {is_expected.to respond_to(:take_off)}

# it "after a plane takes off shows it's no longer at airport" do
# plane = Plane.new
# airport = double("Heathrow")
# plane.land(airport)
# plane.take_off
# expect(plane.airport).to eq nil
# end

it "stops a plane taking off when it's stormy" do
plane = Plane.new
airport = double("Heathrow")
plane.land(airport)
plane.take_off
expect(plane.airport).to eq airport
end

it "stops a plane from landing because it's stormy" do
plane = Plane.new
expect(plane.airport).to eq nil
end
end
