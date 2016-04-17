require 'plane'

describe Plane  do

  describe '#initialize' do
    it 'landed set to false when initialized' do
      expect(subject.instance_variable_get(:@landed)).to eq false
    end
  end

  describe '#land' do
    it 'landed set to true when plane landed' do
      subject.land
      expect(subject.instance_variable_get(:@landed)).to eq true
    end
  end

  describe '#take_off' do
    it 'sets landed to false' do
      subject.take_off
      expect(subject.instance_variable_get(:@landed)).to eq false
    end
  end

end