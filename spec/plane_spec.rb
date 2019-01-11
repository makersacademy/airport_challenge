require "plane"

describe Plane do
  it "Has a method to allow user to land plane at airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "Has a land method which stores the plane at the airport" do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes.first).to eq subject
  end
end
