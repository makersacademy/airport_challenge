require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  describe '#land' do
    it 'allows planes to land' do
    expect(airport).to respond_to(:land).with(1).argument
    end
  end
  describe '#take_off' do
    it 'allows planes to take_off' do
    expect(airport).to respond_to(:take_off).with(1).argument
    end
    it 'raises a message when there are no planes available' do
    expect { airport.take_off(:plane) }.to raise_error 'No planes available'
    end
  end
end
