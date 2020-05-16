require 'plane'
require 'airport'

describe Plane do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'takes an airport as an argument and lands at that airport' do
      airport = Airport.new
      subject.land(airport)
      expect(airport.planes).to include(subject)
    end
  end
  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }


    it 'leaves the airport it has landed in' do
      allow($stdout).to receive(:puts) # supress console output

      airport = Airport.new
      subject.land(airport)
      subject.take_off
      expect(airport.planes).not_to include(subject)
    end

    it 'confirms it has taken off' do
      airport = Airport.new
      subject.land(airport)
      expect { subject.take_off }.to output("[plane is no longer at airport]\n").to_stdout
    end
  end
end
