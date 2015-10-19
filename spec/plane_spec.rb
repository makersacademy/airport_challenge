require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  describe '#initialization' do
    it 'reports a default plane status' do
      expect(subject.status).to eq :flying
    end
  end

  describe '#land' do
    it 'is landing' do
      expect(subject).to respond_to(:land)
    end

    it 'reports a plane status when landed' do
      subject.land
      expect(subject.status).to eq :landed
    end
  end

  describe '#take_off' do
    it 'is taking off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'reports a plane status after take off' do
      subject.take_off
      expect(subject.status).to eq :flying
    end
  end
end