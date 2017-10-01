require 'airport'
require 'plane'

describe Airport do

  let(:airport) { described_class.new }
  let(:plane) { Plane.new }

  context 'when weather is good' do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end


    it 'has a default capacity which can be changed as appropriate' do
      airport.capacity = 10
      expect(airport.capacity).to eq(10)
    end

  end
end
