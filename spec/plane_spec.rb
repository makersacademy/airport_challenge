require 'plane'

describe Plane do

  describe '#config' do

    it 'has a ground status' do
      expect(subject.ground).to eq false
    end

    it 'has a location' do
      expect(subject.location).to eq 'Sky'
    end

    it 'has a name' do
      expect(subject.name).to eq 'EZY123'
    end

  end
end