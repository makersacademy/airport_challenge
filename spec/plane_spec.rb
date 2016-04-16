require 'plane'

describe Plane  do
  let(:airport) { double(:airport, land: true) }

  describe '#landed_status' do
    it 'landed_status set to false when initialized' do
      expect(subject.landed_status).to eq false
    end

    it 'landed_status set to true when plane landed' do
      airport = Airport.new
      airport.land(subject)
      expect(subject.landed_status).to eq true
    end

  end

  describe '#take_off' do
    it 'sets landed_status to false' do
      subject.take_off
      expect(subject.landed_status).to eq false
    end
  end

end