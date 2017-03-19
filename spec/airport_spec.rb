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

  it 'prints a list of all planes at the airport' do
    boeing = double(:plane)
    airport.land(boeing)
    expect(airport.hangar).to include boeing
  end

  it 'confirms that the correct plane has left the airport' do
    boeing = double(:plane)
    airbus = double(:plane)
    airport.land(boeing)
    airport.land(airbus)
    airport.take_off(boeing)
    expect(airport.hangar).not_to include boeing
  end






end
