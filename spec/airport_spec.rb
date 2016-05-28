require 'airport'

describe Airport do
  describe '#full?' do
    it 'capacity of airport is maximum then no landing' do
      subject.current_capacity = 26
      expect(subject.full?).to eq true
    end
    it 'capacity of airport is not maximum then land the aeroplane' do
      subject.current_capacity = 10
      expect(subject.full?).to eq false
    end
  end
end
