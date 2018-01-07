require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe '#lands' do
    it 'has a lands method' do
      is_expected.to respond_to(:lands)
    end
  end

  describe '#takes_off' do
    it 'has a takes_off method' do
      is_expected.to respond_to(:takes_off)
    end
  end

  describe '#status' do
    it 'has a status method' do
      is_expected.to respond_to(:status)
    end
    it 'is flying on instantiation' do
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
