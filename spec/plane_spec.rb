require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:land)}
  it { is_expected.to respond_to(:take_off)}

  context 'the plane' do
    it 'has a status of :flying when created' do
      expect(plane.status).to eq :flying
    end
  end

  context 'a flying plane' do
    it 'has a status of :flying' do
      plane.land
      plane.take_off
      expect(plane.status).to eq :flying
    end
    it 'cannot take off' do
      msg = 'A flying plane cannot take off'
      expect { plane.take_off}.to raise_error(msg)
    end
  end

  context 'a landed plane' do
    it 'has a status of :landed' do
      plane.land
      expect(plane.status).to eq :landed
    end
    it 'cannot land' do
      plane.land
      msg = 'A landed plane cannot land'
      expect { plane.land }.to raise_error(msg)
    end
  end
end
