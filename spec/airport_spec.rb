require './lib/airport.rb'

describe Airport do

it {is_expected.to respond_to :land}

  it "lands a plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

it {is_expected.to respond_to :take_off}

  it "Plane takes off" do
  subject.land(Plane.new)
  expect(subject.take_off).to be_a Plane
end

 it "checks plane has taken off" do
   airport = Airport.new
   plane = Plane.new
   airport.land(plane)
   airport.take_off
   expect(airport.taken_off?(plane)).to eq true
 end
end
