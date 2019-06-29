require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double :plane }
  subject(:airport) { described_class.new }

  describe '#new' do
    it "has no planes when inititialized" do
    expect(airport.planes).to eq []
    end
  end
  describe '#land' do
    it 'allows planes to land' do
    expect(airport).to respond_to(:land).with(1).argument
    end
  end
  describe '#take_off' do
    it 'allows planes to take_off' do
    expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
  describe '#empty_error' do
      it 'sends a message when there are no planes available' do
      expect{ airport.empty_error }.to raise_error  'No planes available'
    end
  end
end
