require 'plane'
require 'airport'

describe Plane do

  it { should be_instance_of(Plane) }

  it { is_expected.to respond_to(:flying)}

  describe '#landing' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it { is_expected. to respond_to(:landed) }

    it 'plane should land at an airport and be stored in that airport' do
      allow(subject).to receive(:bad_weather).and_return(false)
      airport = Airport.new
      expect(subject.land(airport)).to eq(airport.store(subject))
      expect(subject.landed).to eq(true)
      expect(subject.flying).to eq(false)
    end

    it 'plane should not be allowed to land if already landed' do
      allow(subject).to receive(:bad_weather).and_return(false)
      airport = Airport.new
      subject.land(airport)
      expect{subject.land(airport)}.to raise_error('Plane has already landed!')
    end

  end

  describe '#takeoff' do

    it { is_expected.to respond_to(:takeoff_from) }

    it 'plane should takeoff from an airport it has been stored at' do
      allow(subject).to receive(:bad_weather).and_return(false)
      airport = Airport.new
      subject.land(airport)
      expect{subject.takeoff_from(airport)}.not_to raise_error
      expect(subject.landed).to eq (false)
      expect(subject.flying).to eq(true)
    end

    it 'plane should not be allowed to depart from different airport' do
      allow(subject).to receive(:bad_weather).and_return(false)
      airport = Airport.new
      airport2 = Airport.new
      subject.land(airport)
      expect{subject.takeoff_from(airport2)}.to raise_error('Plane cannot depart from airport it did not land at')
    end

    it 'plane should not be allowed to takeoff if it is already flying' do
      allow(subject).to receive(:bad_weather).and_return(false)
      airport = Airport.new
      expect{subject.takeoff_from(airport)}.to raise_error
    end

  end

  describe '#bad weather exceptions' do
    it 'plane should not be allowed to land in bad weather' do
      allow(subject).to receive(:bad_weather).and_return(true)
      airport = Airport.new
      expect{subject.land(airport)}.to raise_error('Warning! Bad weather means plane cannot land.')
    end

     it 'plane should not be allowed to takeoff in bad weather' do
      allow(subject).to receive(:bad_weather).and_return(false)
      airport = Airport.new
      subject.land(airport)
      allow(subject).to receive(:bad_weather).and_return(true)
      expect{subject.takeoff_from(airport)}.to raise_error('Warning! Bad weather means plane cannot takeoff.')
    end
  end

end
