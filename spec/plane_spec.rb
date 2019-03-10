require "plane"

describe Plane do

  subject { Plane.new(Airport.new) }

  it { is_expected.to respond_to(:location) }
  it "can change location attribute using location attr_accessor" do
    subject.location = "test"
    expect(subject.location).to eq "test"
  end
  it "Sets location to a given airport when instantiated" do
    airport = Airport.new
    plane = Plane.new(airport)
    expect(plane.location).to eq airport
  end
end
