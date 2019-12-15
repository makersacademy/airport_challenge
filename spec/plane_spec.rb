describe Plane do
  describe '#flying?' do
    it 'returns true if plane is not landed' do
      expect(subject.flying?).to eq true
    end

    it 'returns false if plane is landed' do
      subject.land
      expect(subject.flying?).to eq false
    end
  end

  describe '#take_off' do
    it 'sets @landed to false' do
      subject.take_off
      expect(subject.landed).to eq false
    end
  end

  describe '#land' do
    it 'sets @landed to true' do
      subject.land
      expect(subject.landed).to eq true
    end
  end
end
