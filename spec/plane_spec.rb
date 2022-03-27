require_relative '../lib/plane.rb'

describe Plane do
  
  describe '#ground' do
    it { is_expected.to respond_to :ground }

    it 'should return false if plane is flying' do
      expect(subject.ground).to be_falsey
    end
  end

  describe '#air' do
    it { is_expected.to respond_to :air }

    it 'should return true if plane is flying' do
      expect(subject.air).to be_truthy
    end
  end
end