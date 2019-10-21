require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  
  it "should create an instance of Airport" do
    expect(airport).to be_instance_of(Airport)
  end
 
  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'does not allow planes to land and take off when stormy' do
    allow(airport).to receive(:bad_weather).and_return true
    expect{airport.land(plane)}.to raise_error ("The landing is not allowed : stormy weather")
  end

  it 'does not allow planes to land when full' do
    airport = Airport.new(20)
    plane = Plane.new
    20.times do
      airport.land(:plane) #using double
    end
    expect {airport.land(:plane)}.to raise_error "Plane cannot land :Airport full" 
  end
end