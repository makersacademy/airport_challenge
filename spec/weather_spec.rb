require 'weather'

describe Weather do

  describe '#stormy?' do
    it 'is stormy if even number' do
    allow(subject).to receive(:random) { 2 }
    expect(subject.stormy?).to eq true
    end

    it 'is NOT stormy if odd number' do
    allow(subject).to receive(:random) { 5 }
    expect(subject.stormy?).to eq false
    end

  end

end
