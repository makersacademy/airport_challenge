require "plane"

describe Plane do

  subject { Plane.new(Airport.new) }

  it { is_expected.to respond_to(:location) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }
  it "Sets location to a given airport when instantiated" do
    airport = Airport.new
    plane = Plane.new(airport)
    expect(plane.location).to eq airport
  end
  it "Sets location to a given airport when land method is called" do
    airport = Airport.new
    subject.land(airport)
    expect(subject.location).to eq airport
  end
  it "Sets location to 'flying' when take_off method is called and weather is sunny" do
    airport = instance_double("Airport", :weather => "sunny")
    plane = Plane.new(airport)
    plane.take_off
    expect(plane.location).to eq "flying"
  end
  it "Throws error when take_off method is called and @weather attribute for aiport is stormy" do
    airport = instance_double("Airport", :weather => "stormy")
    plane = Plane.new(airport)
    expect{plane.take_off}.to raise_error(StandardError)
  end
end
