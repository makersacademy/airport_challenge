require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new(10) }
  let(:plane) { double :plane }

  describe '#land' do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'not allow planes land when airport is full' do
    10.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Airport is full'
  end
end

describe '#take_off' do
  it { is_expected.to respond_to(:take_off).with(1).argument }
end
end
