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

    it 'reports that it is no longer landed after taking off' do
      subject.land(airport)
      subject.takeoff(airport)
      expect(subject.landed).to eq false
    end

    it 'can report which airport it is at after landing' do
      subject.land(airport)
      expect(subject.current_airport).to eq airport
    end

    it 'cannot takeoff from an airport it is not currently at' do
        expect{subject.takeoff(airport)}.to raise_error 'This plane is not at that airport'
    end

end
