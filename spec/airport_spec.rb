require 'airport'

RSpec.describe Airport do 
  it 'should respond to plane' do
    expect(subject).to respond_to :land
  end

  it 'should instruct plane to land' do 
    plane = subject.land(plane)
    expect(plane).to eq plane
  end

  it 'should put a plane in the hanger when lands' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'should respond to take off' do
    expect(subject).to respond_to :take_off
  end

  it 'expected to respond to stormy?' do
    expect(subject).to respond_to :stormy?
  end

  it 'when stormy? is called it returns a boolean' do
    expect(subject.stormy?).to be(true).or be(false)
  end

  it 'prevent takeoff when weather is stormy is true' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.take_off(plane) }.to raise_error 'Planes grounded because of stormy weather'
  end 

  it 'allow takeoff when weather is clear' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(false)
    expect { airport.take_off(plane) }.not_to raise_error 
  end 

  it 'a plane can land after storm has cleared' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(false)
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'fails to let planes land at the airport when full' do
    airport = Airport.new
    allow(airport).to receive(:land).and_raise 'Airport full'
    expect { airport.land }.to raise_error 'Airport full'
  end

  it 'should be able to set to the default capacity if no capacity given' do
    airport = Airport.new
    expect(airport.capacity).to eq 50
  end

  it 'should be able to set airports capacity to a desired capacity' do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
  end

end
