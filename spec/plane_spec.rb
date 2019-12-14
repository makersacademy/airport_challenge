require 'plane'

describe Plane do
  it { is_expected.to respond_to :take_off }

  describe 'in_airport?' do
    it 'confirms if plane is in airport' do
      expect(subject.in_airport?).to eq true
    end
  end

  describe '#take_off' do
    it 'confirms plane is no longer in the airport' do
      plane = Plane.new
      expect(subject.take_off(plane)).to_not eq :in_airport?
    end
  end

end
