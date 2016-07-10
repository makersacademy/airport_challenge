require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let (:airport) {double :airport}

#remember need 100% coverage
#context on weather - is this in airport spec

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

    it 'returns status' do
      expect(subject.land(airport)).to eq(subject.status)
    end


  end

  describe 'take-off' do

    it 'can take off' do
    #expect {subject.take_off}.to
    end
  end


end
