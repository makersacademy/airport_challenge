require './docs/airport.rb'
require './docs/plane.rb'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double:plane}
  let(:boeing) {double:plane, :airborne => false}
  let(:airbus) {double:plane, :airborne => true}

  it 'creates an instance of an Airport' do
    expect(airport).to eq(airport)
    end

  it 'confirms plane has landed at airport' do
    allow(airport).to receive(:weather).and_return(:clear)
    allow(airbus).to receive(:ground).and_return(:airborne => false)
    airport.land(airbus)
    expect(airport.hangar).to include airbus
  end

  it 'confirms plane has taken off from airport' do
    allow(airport).to receive(:weather).and_return(:clear)
    allow(airport).to receive(:hangar).and_return([boeing])
    allow(boeing).to receive(:fly).and_return(:airborne => true)
    airport.take_off(boeing)
    expect(airport.hangar).not_to include boeing
  end

  it 'raises an exception if trying to land a plane that has already landed somewhere' do
    allow(boeing).to receive(:ground)
    expect {airport.land(boeing)}.to raise_error('Cannot land plane: plane has already landed')
  end

  it 'raises an exception when airplane is told to take off and it is not in the hangar' do
  allow(airport).to receive(:weather).and_return(:clear)
    allow(airbus).to receive(:fly).and_return(:airborne => true)
    expect {airport.take_off(airbus)}.to raise_error('Cannot take off plane from this airport: plane is not in hangar')
  end

  it 'expects airports to have a weather status' do
    expect(airport).to respond_to (:check_weather)
  end

  it 'expects a plane not to land if the airport is stormy' do
    allow(airport).to receive(:weather).and_return(:stormy)
    allow(airbus).to receive(:ground).and_return(:airborne => false)
    expect {airport.land(airbus)}.to raise_error('Cannot land plane: condition is stormy. Check weather for update')
  end

  it 'expects a plane not to take off if airport is stormy' do
    allow(airport).to receive(:weather).and_return(:stormy)
    allow(boeing).to receive(:fly).and_return(:airborne => true)
    allow(airport).to receive(:hangar).and_return([boeing])
    expect { airport.take_off(boeing)}.to raise_error('Cannot fly plane: condition is stormy. Check weather for update')
  end

  it 'expects a plane not to land if capacity is full' do
    allow(airport).to receive(:weather).and_return(:clear)
    allow(airbus).to receive(:ground).and_return(:airborne => false)
    Airport::DEFAULT_CAPACITY.times { airport.land(airbus) }
    expect {airport.land(airbus)}.to raise_error('Cannot land plane: airport is full')
  end

end
