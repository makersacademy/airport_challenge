require "airport"
require "plane"

describe Airport do
  
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  
  it 'Lands a plane' do
    plane = Plane.new
    subject.land(plane)
    plane.plane_in_airport
  end
  
  it "gets a plane to takeoff" do
    plane = Plane.new
    airport = Airport.new 
    expect(airport.takeoff(plane)).to eq plane.flying?
  end
  
  it "confirms plane is no longer in airport" do
    plane = Plane.new
    airport = Airport.new
    expect(airport.takeoff(plane)).to eq true
  end
   
   describe '#takeoff' do
    Airport.new.weather("stormy")
  it 'stormy so no takeoff' do
    expect(subject.takeoff(Plane.new)).to raise_error('weather is stormy')
  end
  end
  
  it 'airpot full' do
    plane = Plane.new
    airport = Airport.new
    expect { airport.land(plane) }.to raise_error("airport is full")
  end
  
  describe '#land' do
  it 'raises an error when airport full' do
    Airport::CAPACITY.times { subject.land Plane.new }
    expect{ subject.land Plane.new }.to raise_error('Docking station full')
  end
  end
   

end
