require 'airport'
require 'plane'

RSpec.describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe '#confirmed_landing' do
    it 'parks a plane once it has landed' do
      airport.confirmed_landing("DLH430")
      expect(airport.parked).to include("DLH430")
    end
  end
  
  describe '#initialize' do
    it 'has an adaptable default capacity' do
      airport.capacity = 20
      expect(airport.capacity).to eq(20)
    end
  end

  describe 'weather is good so it is clear to take off' do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end
  end

end
