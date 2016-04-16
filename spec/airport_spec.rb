load 'airport.rb'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane}

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'confirms the plane is in the airport' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end



end