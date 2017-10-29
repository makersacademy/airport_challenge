require 'Airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:land) }

  it { is_expected.to respond_to(:land).with(1).argument }
  it 'has the plane once landed' do
    airport.land(plane)
    expect(airport.hangar).to include plane
  end
end
