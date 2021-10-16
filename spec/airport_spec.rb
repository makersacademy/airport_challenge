require_relative '../lib/airport'
require_relative '../lib/plane'
CAPACITY = 30
# DEFAULT_CAPACITY = 20
subject = Airport.new(CAPACITY)
describe Airport do
  it 'airport should have id' do
    expect(subject.id).to eq(1)
  end
  it 'airport should have a controller' do
    expect(subject.controller).to be_an_instance_of(Controller)
  end
  it 'airport should have plane specified landing capacity' do
    expect(subject.capacity).to eq(CAPACITY)
  end
  it 'airport should have plane default landing capacity if not capacity has been specified' do
    subject = Airport.new
    expect(subject.capacity).to eq(DEFAULT_CAPACITY)
  end
  it 'airport plane parking should be empty initially' do
    expect(subject.spaces).to eq(0)
  end
  it 'landing should add plane to spaces' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.last_space).to eq(plane)
  end
  it 'landing should prevent landing in stormy weather' do
    plane = Plane.new
    subject.update_weather(WEATHER_STATES[:stormy])
    expect { subject.land(plane) }.to raise_error('stormy weather')
  end
  it 'landing should prevent landing when max capacity is reached ' do
    subject.update_weather(WEATHER_STATES[:not_stormy])
    1..CAPACITY.times{subject.land(Plane.new)}
    plane = Plane.new
    expect { subject.land(plane) }.to raise_error('airport at it\'s max capacity')
  end

end
