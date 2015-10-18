require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  it { is_expected.to respond_to(:land)}
  it { is_expected.to respond_to(:take_off)}

  context 'when initialized' do
    it 'has a status of :flying' do
      expect(plane.status).to eq :flying
    end
  end

  context 'after takeoff' do
    it 'has a status of :flying' do
      plane.land airport
      plane.take_off
      expect(plane.status).to eq :flying
    end
    it 'is not located in an airport' do
      plane.land airport
      plane.take_off
      expect(plane.location).to eq :air
    end
    it 'cannot take off' do
      msg = 'A flying plane cannot take off'
      expect { plane.take_off }.to raise_error(msg)
    end
  end

  context 'after landing' do
    it 'has a status of :landed' do
      plane.land airport
      expect(plane.status).to eq :landed
    end
    it 'is located in an airport' do
      plane.land airport
      expect(plane.location).to eq airport
    end
    it 'cannot land' do
      plane.land airport
      msg = 'A landed plane cannot land'
      expect { plane.land airport }.to raise_error(msg)
    end
  end
end
