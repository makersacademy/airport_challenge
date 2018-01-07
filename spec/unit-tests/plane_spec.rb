require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe '#status' do
    it 'is :flying on instantiation' do
      expect(plane.status).to eq :flying
    end
    context 'on landing' do
      it 'status should be :parked' do
        plane.lands
        expect(plane.status).to eq :parked
      end
    end
    context 'on takeoff' do
      it 'status should be :flying' do
        plane.takes_off
        expect(plane.status).to eq :flying
      end
    end
  end
end
