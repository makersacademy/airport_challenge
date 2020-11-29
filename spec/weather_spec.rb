require 'weather'

describe Weather do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  it 'will not let a plane land when it is stormy' do
    expect(airport).to receive(:stormy?).and_return(true)
    plane.land(airport)
    expect { airport.arrive(plane) }.to raise_error "Plane cannot land. Bad weather."
  end

  it 'will not let a plane take off when it is stormy' do
    plane.land(airport)
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.depart(plane) }.to raise_error "Plane cannot depart. Bad weather."
  end
end
