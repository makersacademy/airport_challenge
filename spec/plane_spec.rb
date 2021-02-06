require 'plane'

describe Plane do
subject(:plane) { described_class.new }
let(:airport) { double(:airport, :planes => [plane]) }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#take_off' do
    it 'plane should leave airport when it has been told to take_off' do
    plane.take_off(airport)
    expect(airport.planes).not_to include plane
  end
  end

end
