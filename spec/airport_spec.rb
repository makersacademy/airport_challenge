require 'airport'

describe Airport do
  airport = Airport.new(100)

  it 'tells plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'tells plane to takeoff' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'cannot allow landing when airport full' do
    100.times do
      airport.land(:plane)
    end
    expect { airport.land(:plane) }.to raise_error 'Cannot land: airport full'
  end
end