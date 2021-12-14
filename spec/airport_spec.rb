require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  it 'creates airport' do
    expect(Airport.new).to be_a Airport
  end

  it 'airport responds to land method' do
    expect(Airport.new).to respond_to :land
  end

  it 'creating a new airport creates an empty hangar for landed planes' do
    expect(Airport.new.hangar).to eq []
  end

  it "landing a plan places it in the airport's hangar" do
    allow(weather).to receive(:forecast) { 'clear' }
    allow(plane).to receive(:landed) { false }
    allow(plane).to receive(:airborne) { true }
    heathrow = Airport.new
    heathrow.land(plane, weather)

    expect(heathrow.hangar).to eq [plane]
  end

  it 'airport responds to takeoff method' do
    expect(Airport.new).to respond_to :takeoff
  end

  it 'a plane that takes off from airport returns the plane' do
    allow(plane).to receive(:taken_off) { true }
    allow(plane).to receive(:landed) { false }
    allow(plane).to receive(:airborne) { true }
    allow(weather).to receive(:forecast) { 'clear' }
    heathrow = Airport.new
    heathrow.land(plane, weather)

    expect(heathrow.takeoff(weather)).to eq plane
  end

  it 'after a landed plane takes off, it is no longer at the airport' do
    allow(plane).to receive(:taken_off) { true }
    allow(plane).to receive(:landed) { false }
    allow(plane).to receive(:airborne) { true }
    allow(weather).to receive(:forecast) { 'clear' }
    heathrow = Airport.new
    heathrow.land(plane, weather)
    heathrow.takeoff(weather)

    expect(heathrow.hangar).to eq []
  end

  it 'return error when trying to land plane in a full airport' do
    allow(plane).to receive(:landed) { false }
    allow(plane).to receive(:airborne) { true }
    allow(weather).to receive(:forecast) { 'clear' }
    heathrow = Airport.new
    heathrow.land(plane, weather)

    expect { heathrow.space_available? }.to raise_error 'No space available'
  end

  it 'new airports have a default capacity of 1' do
    expect(Airport.new.capacity).to eq 1
  end

  it 'an airport can be specified a capacity on creation' do
    expect(Airport.new(50, weather).capacity).to eq 50
  end

  it 'an airport can have thier capacity updated to a new value' do
    heathrow = Airport.new
    heathrow.capacity = 50

    expect(heathrow.capacity).to eq 50
  end

  it 'airport responds to weather_clear? method' do
    expect(Airport.new).to respond_to :weather_clear?
  end

  it 'plane does not take off when weather is stormy' do
    allow(plane).to receive(:taken_off) { true }
    allow(plane).to receive(:landed) { false }
    allow(plane).to receive(:airborne) { true }
    allow(weather).to receive(:forecast) { 'stormy' }
    heathrow = Airport.new
    heathrow.instance_variable_set(:@hangar, [plane])

    expect { heathrow.takeoff(weather) }.to raise_error('The weather is too stormy')
  end

  it 'plane cannot land if not airborne' do
    allow(plane).to receive(:taken_off) { true }
    allow(plane).to receive(:landed) { true }
    allow(plane).to receive(:airborne) { true }
    allow(weather).to receive(:forecast) { 'clear' }
    heathrow = Airport.new
    heathrow.land(plane, weather)

    allow(plane).to receive(:landed) { true }
    allow(plane).to receive(:airborne) { false }

    expect { heathrow.land(plane, weather) }.to raise_error('Plane already grounded')
  end

  it 'if no planes in hangar raise error' do
    allow(weather).to receive(:forecast) { 'clear' }
    expect { Airport.new.takeoff }.to raise_error('No planes available')
  end
end
