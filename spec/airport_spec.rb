# this is the spec for the airport

require 'airport'

describe Airport do
  airport = Airport.new

  it 'lands a plane at the airport' do
    expect(airport).to respond_to(:land)
  end

  it 'tells planes to take off' do
    expect(airport).to respond_to(:takeoff)
  end

end
