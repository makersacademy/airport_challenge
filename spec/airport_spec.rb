require 'airport.rb'
require 'plane.rb'

describe Airport do
  it "should create an instance of Airport" do
    airport = Airport.new(20)
    expect(airport).to be_instance_of Airport
  end
  it "should create an instance of Plane" do
    plane = Plane.new
    expect(plane).to be_instance_of Plane
  end
  it 'instructs a plane to land' do
    airport = Airport.new(20)
    expect(airport).to respond_to(:land).with(1).argument
  end
  it 'instructs a plane to take off' do
    airport = Airport.new(20)
    expect(airport).to respond_to(:take_off).with(1).argument
  end
  it 'does not allow planes to land and take off when stormy' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect(airport.land(plane)).to raise_error 'The landing is not allowed : stormy weather'
  end
  it 'does not allow planes to land when full' do
    airport = Airport.new(20)
    plane = Plane.new
    20.times do
      airport.land(:plane) #using double
    end
    expect(airport.land(:plane)).to raise_error "Plane cannot land :Airport full" 
  end
end