require 'airport'

describe Airport do
  airport = Airport.new

  capacity = []

  it 'lands a plane at the airport' do
    expect(airport).to respond_to(:land)
  end

  it 'tells planes to take off' do
    expect(airport).to respond_to(:takeoff)
  end

  it 'gets full' do
    case
    when capacity >= 2
      airport.land(plane)
    else
      expect { airport.land(plane) }.to raise_error 'Airport Full!'
    end

  end

end
