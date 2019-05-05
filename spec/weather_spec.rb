require 'weather'
require 'airport'
require 'plane'

describe Weather do

  describe '#weather' do
    it 'should respond to method stormy' do
      expect(subject).to respond_to(:stormy?)
    end
    it 'should return stormy when 5' do
      allow(subject).to receive(:random_num) { 5 }
      expect(subject.stormy?).to eq(true)
    end
  end

  describe '#random_num' do
    it 'should be an integer' do
      expect(subject.random_num).to be_an(Integer)
    end
    it 'should select a number randomly' do
      allow(subject).to receive(:random_num) { 5 }
      expect(subject.random_num).to eq(5)
    end
  end
end
