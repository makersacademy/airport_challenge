require './lib/weather'

describe Weather do
  it { is_expected.to be_an_instance_of(Weather) }
  it { is_expected.to respond_to(:random_condition) }
  it { is_expected.to respond_to(:stormy?) }
  describe '#random_condition' do
    it 'should return :sunny from @conditions' do
      allow(subject).to receive(:random_condition) { :sunny }
      expect(subject.random_condition).to eq :sunny
    end
    it 'should return :stormy from @conditions' do
      allow(subject).to receive(:random_condition) { :stormy }
      expect(subject.random_condition).to eq :stormy
    end
    describe '#stormy?' do
      it 'should return true if #random_condition returns stormy' do
        allow(subject).to receive(:random_condition) { :stormy }
        expect(subject.random_condition).to eq :stormy
      end
      it 'should return false if #random_condition returns stormy' do
        allow(subject).to receive(:random_condition) { :sunny }
        expect(subject.random_condition).to eq :sunny
      end
    end
  end
end
