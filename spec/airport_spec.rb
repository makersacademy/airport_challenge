require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'will confirm that the plane is no longer in the airport' do
    expect(airport.take_off(:plane)).to eq "The plane: #{:plane} has taken off"
  end

  it 'will instruct a plane to land at an airport' do
    expect(airport.land(:plane)).to include(:plane)
  end

  it 'will prevent landing when the airport is full' do
    airport = Airport.new(5)
    5.times { airport.land(:plane) }
    expect { airport.land(:plane) }.to raise_error "Airport is full"
  end

  it 'will have a default airport capacity that can be overridden as appropriate' do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times { airport.land(:plane) }
    expect { airport.land(:plane) }.to raise_error "Airport is full"
  end

  it 'will prevent takeoff when weather is stormy' do
    airport = Airport.new
    airport.report_storm
    expect { airport.take_off(:plane) }.to raise_error "Plane cannot take off due to storm"
  end

  # it { is_expected.to respond_to :stormy? }

  it { is_expected.to respond_to :report_storm }

  it 'will report the weather as stormy' do
    expect(subject.report_storm).to eq true
  end

  # it 'will output the weather as stormy' do
  #   subject.report_storm
  #   expect(subject).to be_stormy
  # end

  it 'will prevent landing when weather is stormy' do
    subject.report_storm
    expect { subject.land(:plane) }.to raise_error "Plane cannot land due to storm"
  end

  it 'will remove plane from hangar when taken off' do
    airport.land(:plane)
    airport.take_off(:plane)
    expect(airport.hangar).not_to include(:plane)
  end
end
