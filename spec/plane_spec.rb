require 'plane'

describe Plane do

  it 'returns a plane that has left the airport' do
    expect(Plane.new).to be_left_airport
  end

end