require './lib/plane'
require './lib/airport'

describe Plane do

  let(:airport) { Airport.new }

    it 'can land at an airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'can land at a specific airport' do
      subject.land(airport)
      expect(airport.planes.last).to eq (subject)
    end

    it 'confirms that it has landed after a successful landing' do
      subject.land(airport)
      expect(subject.landed).to eq true
    end

    it 'can take off from an airport' do
      expect(subject).to respond_to(:takeoff).with(1).argument
    end

    it 'can take off from an airport' do
      subject.takeoff(airport)
      expect(subject.landed).to eq false
    end

end
