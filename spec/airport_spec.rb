
require './lib/airport.rb'

describe Airport do

  it "is full when capacity is reached" do
    plane = instance_double("Plane")
    subject.capacity.times { subject.land(plane) }
    expect(subject.full?).to eq true
  end

  it "capacity is 10 if set by user" do
    airport = Airport.new(10)
    expect(airport.capacity).to eq 10
  end
end
