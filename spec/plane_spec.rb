require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let (:airport) {double :airport}


  describe 'initialize plane' do

    it 'starts flying' do
      expect(subject.status).to eq(:flying)
    end

    it 'is not in an airport' do
      expect(subject.airport).to eq(nil)
    end
  end

  describe 'land the plane' do

    it 'receives instruction from airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'changes status to landed' do
      subject.land(airport)
      expect(subject.status).to eq(:landed)
    end

    it 'returns status to airport' do
      expect(subject.land(airport)).to eq(subject.status)
    end

    it 'fails when the plane is already landed' do
      subject.land(airport)
      error = 'the plane is already on the ground'
      expect{subject.land(airport)}.to raise_error error
    end
  end

  describe 'take-off' do
    
    it 'receives instruction from the airport' do
      expect(subject).to respond_to(:take_off).with(1).argument #more sophisticated test?
    end

    it 'changes status to flying' do
      subject.take_off(airport)
      expect(subject.status).to eq(:flying)
    end

    it 'returns status to airport' do
      expect(subject.take_off(airport)).to eq(subject.status)
    end

  end
end
