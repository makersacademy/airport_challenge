require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:land)}
  it { is_expected.to respond_to(:take_off)}

  context 'the plane'
    it 'has a status of :flying when created' do
      expect(plane.status).to eq :flying
    end
    it 'has a status of :landed when landed' do
      plane.land
      expect(plane.status).to eq :landed
    end
    it 'has a status of :flying after takeoff' do
      plane.land
      plane.take_off
      expect(plane.status).to eq :flying
    end
end
