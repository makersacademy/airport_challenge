require './lib/Airport'

describe Airport do
  subject(:airport) { described_class.new(20) }

  it 'Creates Airport Instances' do
    expect(airport).to be_instance_of Airport
  end
  it 'Instructs plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end
  it 'Instructs plane to Take_off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
  it 'Does not allow landing when at capacity' do
    20.times { subject.land(:plane) }
    expect { airport.land(:plane) }.to raise_error 'Airport at full Capacity'
  end
end
