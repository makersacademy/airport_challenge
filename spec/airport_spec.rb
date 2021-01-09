require 'airport'

describe Airport do

  it "should allow plane to land in airport" do
    plane = Plane.new
    expect(subject.land(plane)[0]).to eq(plane)
  end

  it "should allow plane to take off" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.runway).not_to include(plane)
  end

  it "should see if the airport is full" do
    airport = Airport.new
    expect(airport.full?).to eq('The runway is full you cannot land')
  end
end
