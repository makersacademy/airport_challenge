require 'plane'

describe Plane do
  context '#initialize' do
    it 'sets landed to false by default' do
      expect(subject.docked).to be_instance_of(FalseClass)
    end
  end

  context '#landed' do
    it 'raises error unless called by Airport' do
      expect { subject.landed }.to raise_error('Unauthorized, ATC request')
    end
  end

  context '#flying' do
    it 'raises error unless called by Airport' do
      exptect { subject.flying }.to raise_error('Unauthorized, ATC request')
    end
  end
end