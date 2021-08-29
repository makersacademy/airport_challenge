require 'plane'

describe Plane do
  describe '#initialize' do
    it 'is expected to assign :landed to true' do
      plane = Plane.new
      expect(plane.landed).to eq true
    end
  end

  describe '#land' do
    it 'is expected to revert :landed to true if currently false' do
      subject.take_off
      expect(subject.land).to eq 'Plane has landed'
      expect(subject.landed).to eq true
    end

    it 'raises error saying that plane is already landed if :landed is true' do
      expect { subject.land }.to raise_error 'Plane is already grounded!'
    end
  end

  describe '#take_off' do
    it 'is expected to revert :landed to false to emulate a plane taking off' do
      expect(subject.take_off).to eq 'Plane has taken off'
      expect(subject.landed).to eq false
    end

    it 'raises error saying that plane is already flying if :landed is false' do
      subject.take_off
      expect { subject.take_off }.to raise_error 'Plane is already flying!'
    end
  end   
end
