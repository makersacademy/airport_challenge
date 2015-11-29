require 'plane'

describe Plane do
  describe '#initialize' do
    it 'should create an in_airport instance variable' do
      expect(subject).to respond_to :in_airport_status
    end
  end

  describe '#take_off' do
    it 'should make a plane take off' do
      subject.take_off
      expect(subject.in_airport_status).to eq false
    end
  end

  describe '#land' do
    it 'should land a plane' do
      subject.land
      expect(subject.in_airport_status).to eq true
    end
  end

  describe '#landed?' do
    it 'should confirm that a plane has landed' do
      subject.land
      expect(subject.in_airport_status).to eq true
    end
  end

  describe '#in_airport?' do
    it 'should confirm that the plane is no longer in the airport' do
      subject.take_off
      expect(subject.in_airport_status).to eq false
    end
  end

end
