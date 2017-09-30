require 'airport.rb'

describe Airport do

  describe 'landing planes' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  describe 'taking planes off' do

    it { is_expected.to respond_to :take_off }

    it 'lets a plane take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end
end
