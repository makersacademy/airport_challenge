require 'plane'

describe Plane do

  describe '#landed_status' do

    it 'landed_status set to false upon initialization' do
      expect(subject.landed_status).to eq false
    end

    it 'landing_status set to true upon landing' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return (false)
      airport.land(subject)
      expect(subject.landed_status).to eq true
    end

    it 'landing_status set to false upon take off' do
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return (false)
    airport.land(subject)
    airport.take_off(subject)
    expect(subject.landed_status).to eq false
    end

  end

end
