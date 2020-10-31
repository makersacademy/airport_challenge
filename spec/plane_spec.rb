require 'plane'

describe Plane do
  context 'landed attr_accessor' do
    it 'can be called on a Plane' do
      expect(subject).to respond_to(:landed)
    end

    it 'is false - i.e. flying - by default' do
      expect(subject.landed).to be_instance_of(FalseClass)
    end
  end
end