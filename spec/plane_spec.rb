require 'plane'

describe Plane do
  describe '#landplane'do
    it { is_expected.to respond_to(:landplane) }

    it 'changes status of flying? to false' do
      subject.fly
      subject.landplane
      expect(subject.flying?).to be false
    end

    it 'is unable to land if not flying' do
      subject.fly
      subject.landplane
      expect { subject.landplane }.to raise_error 'Plane is not flying'
    end
  end

  describe 'fly' do
    it { is_expected.to respond_to(:fly) }

    it 'changes status of flying? to true' do
      subject.fly
      expect(subject.flying?).to be true
    end

    it 'is unable to fly if already flying' do
      subject.fly
      expect { subject.fly}.to raise_error 'Plane is already flying'
    end
  end
end
