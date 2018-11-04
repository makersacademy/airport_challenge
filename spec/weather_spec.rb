require 'weather'
describe Weather do

  it { is_expected.to respond_to :rand_weather }
  describe '#rand_weather' do
    it 'create rand weather_case' do
      expect(subject.rand_weather).to be_between(0, 100)
    end
  end

  describe '#stormy' do

    it { is_expected.to respond_to :stormy }

    it 'returns true if stormy' do
      allow(subject).to receive(:stormy).and_return(true)
      expect(subject.stormy).to eq true
    end

    it 'return false if weather is no stormy' do
      allow(subject).to receive(:stormy).and_return(false)
      expect(subject.stormy).to eq false
    end
  end

  describe '#weather_error' do
    it { is_expected.to respond_to :weather_error }
    it 'send error if plane cant land' do
      expect { subject.weather_error }.to raise_error 'action is unavaible its stormy'
    end
  end
end
