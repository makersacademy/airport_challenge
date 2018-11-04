require 'plane'

describe Plane do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'is only possible to land a flying plane' do
      subject.land('airport')
      expect { subject.land('airport') }.to raise_error 'This plane has already landed'
    end
    it 'is possible to land a plane at a specific airport' do
      expect(subject.land('here').status).to eq 'here'
    end
  end

  describe '#take_off' do
    it 'is possible to order a plane to take off' do
      expect(subject.land('here').take_off.status).to eq 'flying'
    end
    it 'is not possible for an already flying plane to take off' do
      expect { subject.take_off }.to raise_error 'This plane is already in the air'
    end
  end

end
