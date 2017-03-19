require './docs/airport.rb'
require './docs/plane.rb'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double:plane}

  it 'creates an instance of an Airport' do
    expect(airport).to eq(airport)
    end

  it { is_expected.to respond_to(:land).with(1).argument }
  it {is_expected.to respond_to(:take_off).with(1).argument }

  it 'confirms plane has landed at airport' do
    allow(airport).to receive(:weather).and_return(:clear)
    boeing = double("plane", :airborne => true)
    allow(boeing).to receive(:ground).and_return(:airborne => false)
    airport.land(boeing)
    expect(airport.hangar).to include boeing
  end

  it 'confirms plane has taken off from airport' do
    allow(airport).to receive(:weather).and_return(:clear)
    boeing = double("plane", :airborne => false)
    allow(airport).to receive(:hangar).and_return([boeing])
    allow(boeing).to receive(:fly).and_return(:airborne => true)
    airport.take_off(boeing)
    expect(airport.hangar).not_to include boeing
  end

  it 'raises an exception if trying to land a plane that has already landed somewhere' do
    boeing = double("plane", :airborne => false)
    allow(boeing).to receive(:ground)
    expect {airport.land(boeing)}.to raise_error('Plane has already landed')
  end

  it 'raises an exception when airplane that has taken off is told to take off again' do
  allow(airport).to receive(:weather).and_return(:clear)
    boeing = double("plane", :airborne => true)
    allow(boeing).to receive(:fly).and_return(:airborne => true)
    expect {airport.take_off(boeing)}.to raise_error('Plane not in hangar')
  end

  it 'expects airports to have a weather status' do
    expect(airport).to respond_to (:check_weather)
  end

  it 'expects a plane not to land if the airport is stormy' do
    allow(airport).to receive(:weather).and_return(:stormy)
    boeing = double("plane", :airborne => true)
    allow(boeing).to receive(:ground).and_return(:airborne => false)
    expect(airport.land(boeing)).to eq('Plane cannot land in stormy conditions')
  end

  it 'expects a plane not to take off if airport is stormy' do
    allow(airport).to receive(:weather).and_return(:stormy)
    boeing = double("plane", :airborne => false)
    allow(boeing).to receive(:fly).and_return(:airborne => true)
    allow(airport).to receive(:hangar).and_return([boeing])
    expect(airport.take_off(boeing)).to eq('Plane cannot take off in stormy conditions')
  end

  # it 'expects a plane to land after storm has subsided' do
  #   allow(airport).to receive(:weather).and_return(:stormy)
  #   boeing = double("plane", :airborne => true)
  #   allow(boeing).to receive(:ground).and_return(:airborne => false)
  #   allow(airport).to receive(:check_weather).and_return(:update_weather)
  #   airport.check_weather
  #   expect(airport.land(boeing)).not_to eq('Plane cannot land in stormy conditions')
  # end

end
