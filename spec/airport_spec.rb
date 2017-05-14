require 'airport'

describe Airport do
  it 'responds to instruct_to_land method' do
    expect(subject).to respond_to(:instruct_to_land).with(1).argument
  end
  it 'responds to landed_planes method' do
    expect(subject).to respond_to(:landed_planes)
  end
  it 'should return array if landed_planes method is called on it' do
    expect(subject.landed_planes.class).to eq Array
  end
  it 'should be initialized as an empty airport, i.e. landed_planes is empty' do
    expect(subject.landed_planes.empty?).to eq true
  end
  it 'should store the landed plane if a plane is instructed to land' do
    plane = double
    allow(plane).to receive(:update_location_after_landing_to)
    allow(plane).to receive(:report_landed)
    airport = subject
    allow(airport.weather).to receive(:safe?){true}
    airport.instruct_to_land(plane)
    expect(airport.landed_planes[-1]).to eq plane
  end
  it 'should respond to instruct_to_take_off' do
    expect(subject).to respond_to(:instruct_to_take_off).with(1).argument
  end
  it 'should release the plane from @landed_planes as soon #instruct_to_take_off is called with that plane as argument' do
    plane = double
    allow(plane).to receive(:update_location_after_landing_to)
    allow(plane).to receive(:report_landed)
    allow(plane).to receive(:update_location_after_take_off_from)
    allow(plane).to receive(:report_take_off)
    airport = subject
    allow(airport.weather).to receive(:safe?){true}
    airport.instruct_to_land(plane)
    airport.instruct_to_take_off(plane)
    expect(airport.landed_planes.include?(plane)).to eq false
  end
  it 'should respond to #weather' do
    expect(subject).to respond_to(:weather)
  end
  it 'should be initialized with a Weather object in @weather' do
    expect(subject.weather.class).to eq Weather
  end
  it 'should raise an error if a plane is instructed to land in stormy weather' do
    airport = subject
    allow(airport.weather).to receive(:safe?){false}
    plane = double
    allow(plane).to receive(:update_location_after_landing_to)
    allow(plane).to receive(:report_landed)
    expect{airport.instruct_to_land(plane)}.to raise_error(RuntimeError, "The weather is stormy. Landing not allowed.")
  end
  it 'should raise an error if a plane is instructed to take off in stormy weather' do
    airport = subject
    allow(airport.weather).to receive(:safe?){false}
    plane = double
    allow(plane).to receive(:update_location_after_landing_to)
    allow(plane).to receive(:report_landed)
    allow(plane).to receive(:update_location_after_take_off_from)
    allow(plane).to receive(:report_take_off)
    expect{airport.instruct_to_take_off(plane)}.to raise_error(RuntimeError, "The weather is stormy. Take off not allowed.")
  end
  it 'should respond to #capacity' do
    expect(subject).to respond_to(:capacity)
  end
  describe '#capacity' do
    it 'should return an integer' do
      expect(subject.capacity.class).to eq Integer
    end
  end
  it 'should respond to #full?' do
    expect(subject).to respond_to(:full?)
  end
  describe '#full?' do
    it 'should return true or false' do
      expect([true, false].include?(subject.full?)).to eq true
    end
    it 'should return true if at capacity, false when below capacity' do
      airport = subject
      allow(airport.landed_planes).to receive(:length){0}
      expect(airport.full?).to eq false
      allow(airport.landed_planes).to receive(:length){25}
      expect(airport.full?).to eq false
      allow(airport.landed_planes).to receive(:length){50}
      expect(airport.full?).to eq true
    end

  end

end
