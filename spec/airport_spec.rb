require 'airport'

describe Airport do

  subject(:airport) { Airport.new(20) }

  it 'instruct a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instruct a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'does not allow landing when full' do
    plane = double :plane
    20.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Cannot land plane - airport full"
  end
end