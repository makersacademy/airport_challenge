require 'weather'

describe Weather do
    it 'checks that the weather is not stormy' do
      srand(17)
      expect(subject.forecast).to eq :sunny
    end

    it 'checks that weather is stormy' do
      srand(13)
      expect(subject.forecast).to eq :stormy
    end

    it 'confirms weather is stormy' do
      subject.weather = :stormy
      expect(subject.stormy?).to eq true
    end
end