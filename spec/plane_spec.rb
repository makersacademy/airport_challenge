require 'plane'

describe Plane do


  it { is_expected.to respond_to :arrive_at_airport }

  it { is_expected.to respond_to :depart_from_airport }


    describe '#arrive_at_airport' do
      it 'raises an error - too stormy to depart' do
        expect(subject).to receive(:stormy_weather).and_return(1)
        expect(subject.arrive_at_airport).to raise_error "Too stormy to depart"
    end
  end


  describe '#depart_from_airport' do
    it 'raises an error - too stormy to depart' do
      expect(subject).to receive(:stormy_weather).and_return(1)
      expect(subject.depart_from_airport).to raise_error "Too stormy to depart"
  end
end

  it 'expects stormy_weather? to return Integer' do
    expect(subject.stormy_weather?).to be_a_kind_of(Integer)
  end

  it 'expects stormy_weather? to only return an Integer between 0..100' do
    expect(subject.stormy_weather?).to be_between(0, 100)
  end

  describe '#stormy_weather?' do
    it 'calls rand'  do
      expect(subject).to receive(:rand).and_return(0)
      expect(subject.stormy_weather?).to eq 0
    end
  end

end
