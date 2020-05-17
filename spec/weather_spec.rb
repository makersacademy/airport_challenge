require 'weather'

describe Weather do
  describe '#generate' do
    it 'is sunny when random_number is 80 or less' do
      allow(subject).to receive(:ramdom_number).and_return(1)
      expect(subject.generate).to eq 'sunny'
    end

    it 'is stormy when random_number is over 80' do
      allow(subject).to receive(:ramdom_number).and_return(81)
      expect(subject.generate).to eq 'stormy'
    end
  end
end
