require 'airport'
require 'plane'

describe Airport do 
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'expects a plane to land at an aiport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
  end 

  it 'expects instances of Airport class to respond to the take_off method' do 
    plane = Plane.new
    expect(Airport.new).to respond_to(:take_off)
  end 

  it 'should not be able to take_off if no planes have already landed' do
    expect { subject.take_off }.to raise_error 'No planes ready to take off'
  end

  it 'raises an error if landing space is full ' do
    Airport::DEFAULT_CAPACITY.times {subject.land(Plane.new)}
    plane = Plane.new
    expect {subject.land(plane)}.to raise_error 'Not accepting more planes to land'
  end

  it "expects to be able to set passed capacity" do
    number = 15
    airport = Airport.new(number)
    expect(airport.capacity).to eq number
  end

  it "expects default capacity to be ten " do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
end