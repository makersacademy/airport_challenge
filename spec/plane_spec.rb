require 'plane'
require 'airport'

describe Plane do

  it { should be_instance_of(Plane) }

  it { is_expected.to respond_to(:flying)}

  it { is_expected.to respond_to(:takeoff) }

  it { is_expected. to respond_to(:takeoff?) }


  describe '#landing' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it { is_expected. to respond_to(:landed) }

    it 'plane should land at an airport and be stored in that airport' do
      airport = Airport.new
      expect(subject.land(airport)).to eq(airport.store(subject))
      expect(subject.landed).to eq(true)
      expect(subject.flying).to eq(false)
    end

    it 'plane should not be allowed to land if already landed' do
      airport = Airport.new
      subject.land(airport)
      expect{subject.land(airport)}.to raise_error('Plane has already landed!')
    end

  end

end
