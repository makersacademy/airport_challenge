require 'Airport'
describe Airport do
it { is_expected.to respond_to(:land).with(1).argument }

  it 'for planes to land at aiport, instruct plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'for planes to takeoff, instruct planes to takeoff' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.takeoff(plane) }.not_to raise_error
  end

  it 'not letting plane takeoff' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.takeoff(plane) }.to raise_error 'cannot let plane takeoff due to stormy weather'
  end

  it 'not letting plane land' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error 'cannot let plane land due to stormy weather'
  end
end
