require_relative '../lib/airport'
require_relative '../lib/plane'
DEFAULT_AIRPORT_LANDED_PLANES = 0
CAPACITY = 30

describe Airport do
  before do
    Airport.new
    allow(subject).to receive(:stormy?).and_return WEATHER_STATES[:not_stormy]
  end
  it 'airport should have id' do
    expect(subject.id).to eq(1)
  end
  it 'airport should have plane specified landing capacity' do
    subject = Airport.new(CAPACITY)
    expect(subject.capacity).to eq(CAPACITY)
  end
  it 'airport should have plane default landing capacity if not capacity has been specified' do
    subject = Airport.new
    expect(subject.capacity).to eq(DEFAULT_CAPACITY)
  end
  it 'airport plane parking should be empty initially' do
    expect(subject.spaces).to eq(DEFAULT_AIRPORT_LANDED_PLANES)
  end
  it 'landing should add plane to spaces' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.last_space).to eq(plane)
  end
  it 'landing should prevent landing in stormy weather' do
    plane = Plane.new
    # subject.update_weather(WEATHER_STATES[:stormy])
    allow(subject).to receive(:stormy?).and_return WEATHER_STATES[:stormy]
    expect { subject.land(plane) }.to raise_error('stormy weather')
  end
  it 'landing should prevent landing when max capacity is reached ' do
    1..DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    plane = Plane.new
    expect { subject.land(plane) }.to raise_error('airport at it\'s max capacity')
  end
  it 'take_off should instruct plane to take off in not stormy weather' do
    subject.land(Plane.new)
    expect(subject.take_off).to eq('confirmed take off')
  end
  it 'take off should prevent to take off in stormy weather' do
    subject.land(Plane.new)
    allow(subject).to receive(:stormy?).and_return WEATHER_STATES[:stormy]
    expect { subject.take_off }.to raise_error('stormy weather')
  end
  it 'take off should prevent to take off if empty spaces' do
    expect { subject.take_off }.to raise_error('no plane available')
  end
end
