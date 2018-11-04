require 'airport'

describe Airport do

  describe '#arrival' do

    it { is_expected.to respond_to(:arrival).with(2).argument }

    it 'throw error when airport is full' do
      50.times { subject.arrival(Plane.new, 50) }
      expect { subject.arrival(Plane.new, 50) }.to raise_error 'airport is full'
    end

    it 'add plane to airport' do
      plane = Plane.new
      expect(subject.arrival(plane, 5)).to eq 1
    end
  end

  describe '#departure' do
    it { is_expected.to respond_to :departure }

    it 'remove plain from airport when plain off' do
      expect(subject.departure).to eq 0
    end
  end
end
