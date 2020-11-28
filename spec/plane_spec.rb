require 'plane'

describe Plane do
  let(:airport) { Airport.new }

  it 'lands in the airport' do
    expect { subject.land(airport) }.to(change { airport.ramp }.from([]).to([subject]))
  end

  it 'takes off from the airport' do
    airport.ramp << subject
    expect { subject.takeoff(airport) }.to(change { airport.ramp }.from([subject]).to([]))
  end

end
