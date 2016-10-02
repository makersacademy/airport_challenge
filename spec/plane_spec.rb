require './lib/plane'

describe Plane do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new(airport) }

  before do
    allow(Weather).to receive(:sunny?) {true}
  end

  it 'can land at an airport' do
    expect(plane).to respond_to(:land).with(1).argument
  end

  it 'can land at a specific airport' do
    plane.takeoff(airport)
    plane.land(airport)
    expect(airport.planes.last).to eq (plane)
  end

  it 'confirms that it has landed after a successful landing' do
    plane.takeoff(airport)
    plane.land(airport)
    expect(plane.landed).to eq true
  end

  it 'can take off from an airport' do
    expect(plane).to respond_to(:takeoff).with(1).argument
  end

  it 'reports that it is no longer landed after taking off' do
    plane.takeoff(airport)
    expect(plane.landed).to eq false
  end

  it 'can report which airport it is at after landing' do
    plane.takeoff(airport)
    plane.land(airport)
    expect(plane.current_airport).to eq airport
  end

  it 'cannot takeoff from an airport it is not currently at' do
      expect{plane.takeoff(Airport.new)}.to raise_error 'This plane is not at that airport'
  end

end
