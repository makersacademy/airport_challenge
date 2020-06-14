require 'weather'

describe Weather do
  describe '#check' do
    it 'returns a stormy or sunny randomly' do
      allow(subject).to receive(:check) { :stormy }
      expect(subject.check).to eq :stormy
    end

    it 'returns sunny most of the time' do
      weather = Weather.new
      array = []
      20.times { array << weather.check }
      expect(array).to include(:stormy)
    end
  end
end
