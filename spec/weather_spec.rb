require 'weather'

describe Weather do

  describe '#stormy?' do
    it {is_expected.to respond_to :stormy?}

    it 'should tell if it is stormy or not' do
      allow(subject).to receive(:stormy?) {true}
      expect(subject.stormy?).to eq true
    end
  end

    it 'should check that random outlook is sunny' do
      allow(subject).to receive(:random_outlook) {:stormy}
      expect(subject.random_outlook).to eq :stormy
    end
end
