require 'airport'
require 'plane'

describe Airport do
  airport = Airport.new
  plane = Plane.new

  it { is_expected.to respond_to(:confirm_takeoff) }
  it { is_expected.to respond_to(:full?) }

  it 'raises error if a plane tries to land at a full airport' do
    message = 'No clearance to land: Airport is full'
    expect { airport.land(plane) }.to raise_error message
  end

end
