require 'plane'

describe Plane do

  describe '#land' do
    it 'has landed' do
      subject.land
      expect(subject.landed).to eq true
    end

    it 'raises error if plane already landed' do
      subject.land
      message = 'Plane in land, cannot land again!'
      expect { subject.land }.to raise_error(message)
    end
  end

  describe '#take_off' do
    before(:each) do
      subject.land
    end

    it 'is no longer in land' do
      subject.take_off
      expect(subject.landed).to eq false
    end

    it 'raises error if plane already took off' do
      subject.take_off
      message = 'Plane in flight, cannot take off again!'
      expect { subject.take_off }.to raise_error(message)
    end
  end
end
