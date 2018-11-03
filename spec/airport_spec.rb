require 'airport'

describe Airport do

  describe '#arrival' do

    it { is_expected.to respond_to(:arrival).with(1).argument }

    it 'add plane to airport' do
      plane = Plane.new
      expect(subject.arrival(plane)).to eq 1
    end
  end

  describe '#departure' do

    it { is_expected.to respond_to :departure }

    it 'remove plain from airport when plain off' do
      expect(subject.departure).to eq 0
    end
  end
end
