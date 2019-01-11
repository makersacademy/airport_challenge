require 'plane'
require 'airport'

describe Plane do

  it { is_expected.to respond_to(:location) }

  let(:airport) { Airport.new }

  describe '#location' do
    before do
      allow(airport).to receive(:weather).and_return(false)
    end

    it 'should default to flying' do
      expect(subject.location).to eq "flying"
    end

    it 'should update its location once landed' do
      airport.land(subject)
      expect(subject.location).to eq airport
    end

    it 'should raise an error if a non flying plane is attempted to be landed' do
      airport.land(subject)
      expect { airport.land(subject) }.to raise_error("Unable to land as plane as isnt flying")
    end

    it 'should update its location once taken off' do
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.location).to eq "flying"
    end

    it 'should raise and error if a flying plane attempts to take off' do
      expect { airport.take_off(subject) }.to raise_error("Unable to take off as plane isn't in airport")
    end

    it 'should raise an error if a plane attempts to take off from different airport' do
      airport.land(subject)
      airport2 = Airport.new
      expect { airport2.take_off(subject) }.to raise_error("Unable to take off as plane isn't in airport")
    end

  end

end
