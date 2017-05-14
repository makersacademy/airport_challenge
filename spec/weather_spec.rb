require './lib/weather'

describe Weather do
  it { is_expected.to be_an_instance_of(Weather) }
  it { is_expected.to respond_to(:random_condition) }
  it { is_expected.to respond_to(:stormy?) }
  describe '#random_condition' do
    it 'should return :sunny from CONDITIONS' do
      allow(subject).to receive(:random_condition) { :sunny }
      expect(subject.random_condition).to eq :sunny
    end
    it 'should return :stormy from CONDITIONS' do
      allow(subject).to receive(:random_condition) { :stormy }
      expect(subject.random_condition).to eq :stormy
    end
    describe '#stormy?' do
      it 'should return true if #stormy? evaluates to stormy' do
        allow(subject).to receive(:random_condition) { :stormy }
        expect(subject.stormy?).to eq true
      end
      it 'should return false if #stormy? evaluates to stormy' do
        allow(subject).to receive(:random_condition) { :sunny }
        expect(subject.stormy?).to eq false
      end
      describe 'CONDITIONS' do
        it 'test CONDITIONS array to return :stormy' do
          allow(subject).to receive(:conditions) { :stormy }
          expect(subject.conditions).to eq :stormy
        end
        it 'test CONDITIONS array to return :sunny' do
          allow(subject).to receive(:conditions) { :sunny }
          expect(subject.conditions).to eq :sunny
        end
      end
    end
  end
end
