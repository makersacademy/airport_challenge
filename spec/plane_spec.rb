require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double(:airport) }

  it 'can create an instance of Plane class' do
    expect(subject).to be_instance_of(Plane)
  end

  context 'when landing' do
    it 'lands successfully' do
      subject.land(airport)
      expect(subject.grounded_at?(airport)).to be true
    end

    it 'fails to land when already grounded' do
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error 'Plane is already grounded'
    end
  end

  context 'when taking off' do
    it 'takes off successfully' do
      subject.land(airport)
      subject.take_off
      expect(subject.landed?).to be false
    end

    it 'fails to take off when already airborne' do
      expect { subject.take_off }.to raise_error 'Plane is already airborne'
    end
  end
end
