require 'airport.rb'
require 'plane.rb'

describe Airport do
  it "should create an instance of Airport" do
    airport = Airport.new
    expect(airport).to be_instance_of Airport
  end
  it "should create an instance of Plane" do
    plane = Plane.new
    expect(plane).to be_instance_of Plane
  end
  it 'instructs a plane to land' do
    airport = Airport.new
    expect(airport).to respond_to(:land).with(1).argument
  end
  it 'instructs a plane to take off' do
    airport = Airport.new
    expect(airport).to respond_to(:take_off).with(1).argument
  end
end