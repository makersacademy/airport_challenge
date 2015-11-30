require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  describe '#initialize' do
    it 'should create an in_airport instance variable' do
      expect(plane).to respond_to :in_airport_status
    end
  end

  describe '#take_off' do
    it 'should make a plane take off' do
      plane.take_off
      expect(plane.in_airport_status).to eq false
    end
  end

  describe '#land' do
    it 'should land a plane' do
      plane.land
      expect(plane.in_airport_status).to eq true
    end
  end

  describe '#landed?' do
    it 'should confirm that a plane has landed' do
      plane.land
      expect(plane.in_airport_status).to eq true
    end
  end

  describe '#in_airport?' do
    it 'should confirm that the plane is no longer in the airport' do
      plane.take_off
      expect(plane.in_airport_status).to eq false
    end
  end

end
