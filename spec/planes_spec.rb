require 'planes'

describe Planes do

  subject(:plane) { described_class.new }

  context '#land' do
    it 'Plane is landed at initialization' do
      expect(plane.landed).to eq true
    end

    it 'Plane is landed after landing' do
      plane.take_off
      plane.land

      expect(plane.landed).to eq true
    end
  end

  context '#take_off' do
    it 'Plane is not landed after takes off' do
      plane.take_off
      expect(plane.landed).to eq false
    end
  end

end
