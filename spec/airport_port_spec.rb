require 'airport.rb'

describe Airport do
let(:plane1) {Plane.new}
  describe '#lands' do
    context 'when spare capacity at airport' do
      it 'lands a plane' do
        expect(subject.lands(plane1)).to eq plane1
      end
    end
    context 'when airport full as reached default capacity,' do
      it 'plane causes airport full error' do
        described_class::DEFAULT_CAPACITY.times {subject.lands(plane1)}
        expect {subject.lands(plane1)}.to raise_error("airport is full")
      end
    end

  end

  describe '#takes_off' do
    it 'takes_off a plane' do
      expect(subject.takes_off(plane1)).to eq plane1
    end
  end



end