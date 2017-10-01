require 'plane'

describe Plane do

  it 'expects the plane to arrive at airport' do
    expect(subject.arrive_at_airport).to eq true
  end

  it 'expects the plane to depart from airport' do
   expect(subject.depart_from_airport).to eq true
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
