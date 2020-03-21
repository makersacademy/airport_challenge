require 'airport'

describe Airport do

  it 'instructs plane to land and confirms landing' do
    plane = Plane.new
    expect(subject.land(plane)).to eq true
  end

  it 'instructs plane to land' do
    expect(subject).to respond_to :land
  end

  it 'instructs plane to take off and confirms take off' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq true
  end

  it 'instructs plane to take off' do
    expect(subject).to respond_to :take_off
  end

  it 'prevents landing if airport is full at DEFAULT_CAPACITY' do
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'Airport full'
  end

  it 'DEFAULT_CAPACITY can be overriden' do
    airport = Airport.new(100)
    99.times { airport.land(Plane.new) }
    expect(airport.land(Plane.new)).to eq true
  end

  it 'prevents landing if airport is full at an overriden capacity' do
    airport = Airport.new(100)
    100.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error 'Airport full'
  end

end
