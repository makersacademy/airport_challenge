require './lib/airport'
require './lib/plane'
require './lib/weather_report'

describe Airport do
  airport = Airport.new
  plane = Plane.new
  subject(:airport) { described_class.new }
  
  before do
    allow(subject).to receive(:stormy?).and_return(false)
  end

  it 'allows a plane to land at the airport' do
    expect(subject.land(plane)).to eq plane
  end

  it 'allows a plane to take off from the airport' do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'doesn\'t allow a plane to land if airport capacity reached' do
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'No capacity at airport'
  end

  it 'default plane capacity can be overwritten' do
    subject = Airport.new(1)
    expect(subject.plane_capacity).to eq 1
  end
end
