require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double(:airport) }

  it 'can create an instance of Plane class' do
    expect(plane).to be_instance_of(Plane)
  end

  context 'when landing' do
    it 'lands successfully' do
      plane.land(airport)
      expect(plane.grounded_at?(airport)).to be true
    end

    it 'fails to land when already grounded' do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error 'Plane is already grounded'
    end
  end

  context 'when taking off' do
    it 'takes off successfully' do
      plane.land(airport)
      plane.take_off
      expect(plane.landed?).to be false
    end

    it 'fails to take off when already airborne' do
      expect { plane.take_off }.to raise_error 'Plane is already airborne'
    end
  end
end
