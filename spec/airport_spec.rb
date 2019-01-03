require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }

  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to takeoff' do
    expect(airport).to respond_to(:takeoff).with(1).argument
  end

  it 'planes are unable to land when capacity is full' do
    plane = double :plane
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Plane is unable to land: airport is full'
  end
end
