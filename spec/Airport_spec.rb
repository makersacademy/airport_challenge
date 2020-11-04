require './lib/Airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane}

  it 'Creates Airport Instances' do
    expect(airport).to be_instance_of Airport
  end
describe '#land' do
  it 'Instructs plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end
  context 'When at capacity' do
    it 'Raise an Error' do
    20.times { subject.land(:plane) }
    expect { airport.land(:plane) }.to raise_error 'Airport at full Capacity'
  end
  end
end
describe '#take_off' do
  it 'Instructs plane to Take_off' do
    expect(airport).to respond_to(:take_off)
  end
end

context 'defaults' do
  subject(:default_airport) { Airport.new}

  it ' has a default capacity' do
    Airport::DEFAULT_CAPACITY.times { default_airport.land(plane) }
    expect { default_airport.land(plane) }.to raise_error 'Airport at full Capacity'
  end
end
end
