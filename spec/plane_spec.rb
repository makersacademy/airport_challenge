require 'plane.rb'

describe Plane do
sadadsvdsvd
  describe '#initialize' do
    it 'checks planes that are created are not set to landed' do
    plane = Plane.new
    expect(plane.landed).to eq false
    end
  end

  describe '#in_airport?' do
    it '#checks a plane in airport is set as such' do
      subject.land
      expect(subject.in_airport?).to eq true
    end

    it '#checks a plane landed ans taken off is set as such' do
      subject.land
      subject.take_off
      expect(subject.in_airport?).to eq false
    end
  end
end
