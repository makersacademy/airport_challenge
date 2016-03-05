require 'weather'

describe Weather do

  describe '#random_num' do
    it { is_expected.to respond_to(:random_num) } 

    it 'will return a number between 1 and 6' do
      expect(subject.random_num).to be_within(3).of(3)
    end
  end

  describe '#stormy' do
    it { is_expected.to respond_to(:stormy?) } 
    
    it 'will return true if random_num is 5' do
    allow(subject).to receive(:random_num).and_return 5
    expect(subject.stormy?).to eq true
    end
   
    it 'will return false if random_num is 3' do
    allow(subject).to receive(:random_num).and_return 3
    expect(subject.stormy?).to eq false
    end

  end

end
