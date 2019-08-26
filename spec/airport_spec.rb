
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
  it "contains plane when plane has landed" do
    plane = instance_double("Plane")
    subject.land(plane)
    expect(subject.contains?(plane)).to eq(true)
  end
  it "doesn't contain plane when plane has taken off" do
    plane = instance_double("Plane")
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.contains?(plane)).to eq(false)
  end
  it "prevents landing if full" do
    plane = instance_double("Plane")
    subject.capacity.times { subject.land(plane) }
    expect{ subject.land(plane) }.to raise_error "Landing not permitted as airport is full"
  end
  it 'prevents take off if plane not at airport' do
    plane = instance_double("Plane")
    expect{ subject.takeoff(plane) }.to raise_error 'Plane is not at the airport'
  end
end
