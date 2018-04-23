require 'weather'

describe Weather do

  describe '#stormy_conditions?' do
    it { is_expected.to respond_to :random }
    it "returns true if stormy conditions" do
      expect(subject).to receive(:random).and_return(true)
      expect(subject.random).to eq true
    end
    it 'returns false if stormy conditions' do
      expect(subject).to receive(:random).and_return(false)
      expect(subject.random).to eq false
    end
  end

  describe '#random' do
    let(:subject) { Weather.new }
    it 'calls' do
      expect(subject).to receive(:rand).and_return(0.2)
      expect(subject.random).to eq 0.2
    end
  end

end
