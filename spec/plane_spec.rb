require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) { double(:airport) }

  context 'landing' do
    it 'a plane not flying cannot land' do
      plane.land
      expect{ plane.land }.to raise_error 'Not flying'
    end
  end

  context 'take off' do
    it 'a flying plane cannot take off' do
      expect{ plane.take_off }.to raise_error 'Already flying'
    end
  end
end
