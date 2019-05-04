require 'weather'
require 'airport'
require 'plane'

describe Weather do

  describe '#weather' do
    it 'should respond to method stormy' do
      expect(subject).to respond_to(:weather)
    end
    it 'should return stormy when 85 or higher' do
      allow(subject).to receive(:random_num) { 85 }
      expect(subject.weather).to eq("stormy")
    end
    it 'should return fair when 84 or lower' do
      allow(subject).to receive(:random_num) { 84 }
      expect(subject.weather).to eq("fair")
    end
  end

  describe '#random_num' do
    it 'should be a random integer' do
      expect(subject.random_num).to be_an(Integer)
    end
  end
end
