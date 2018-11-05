require 'plane'

describe Plane do

  let(:airport) { double :airport }

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#landed' do
    it 'is only possible to land a flying plane' do
      subject.landed(airport)
      expect { subject.landed(airport) }.to raise_error 'This plane has already landed'
    end
    it 'is possible to land a plane at a specific airport' do
      expect(subject.landed(airport).status).to eq airport
    end
  end

  describe '#taken_off' do
    it 'is possible to order a plane to take off' do
      expect(subject.landed(airport).taken_off.status).to eq 'flying'
    end
    it 'is not possible for an already flying plane to take off' do
      expect { subject.taken_off }.to raise_error 'This plane is already in the air'
    end
  end

end
