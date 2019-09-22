require 'airport'

describe Airport do

  describe '#let_land' do
    it { is_expected.to respond_to(:let_land).with(1).argument }

    it 'raise an error if airport is full' do
      airport = Airport.new(5)
      5.times{ airport.let_land(Plane.new)}
      expect{ airport.let_land(Plane.new)}.to raise_error 'Impossible, airport full'
    end

    let(:plane) { Plane.new }
    it 'raise error if plane already landed' do
      plane.landed = true
      expect {subject.let_land(plane)}.to raise_error 'Impossible, plane already landed'
    end
    it 'land a plane' do
      expect(subject.let_land(plane)).to eq subject.planes
    end
  end

  describe '#let_take_off' do
    let(:plane) { Plane.new }
    it { is_expected.to respond_to(:let_take_off).with(1).argument }

    it 'raise an error if plane is already flying' do
      plane.flying = true
      expect {subject.let_take_off(plane)}.to raise_error 'Impossible to take off, plane is already flying'
    end
    it 'take off a plane' do
      expect(subject.let_take_off(plane)).to eq subject.planes
    end
  end
end
