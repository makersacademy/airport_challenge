require 'plane'
require 'airport'
require 'weather'

describe Plane do

  describe '#landing' do
    it 'can land' do
      allow(subject).to receive(:flying).and_return(true)
      subject.land
      expect(subject.landing).to eq true
    end

    it 'lands at airport' do
      allow(subject).to receive(:landing).and_return(true)
      ap = Airport.new
      ap.land_on_runway(subject)
      expect(ap.planes).to eq [subject]
    end

    it "doesn't land in a storm" do
      weather = double(:weather)
      allow(weather).to receive(:check_for_storm).and_return(true)
      subject.stormy?(weather)
      expect { subject.land }.to raise_error "Can't land in a storm"
    end

    it "doesn't let landed planes land again" do
      subject.landed
      expect { subject.land }.to raise_error "Landed plane can't land again"
    end

    it "checks landed planes are at the airport" do
      allow(subject).to receive(:landed).and_return(true)
      expect(subject.at_airport?).to eq true
    end

  end

  describe '#take off' do
    it 'takes off from airport' do
      allow(subject).to receive(:takes_off).and_return(true)
      ap = Airport.new
      ap.planes << subject
      ap.take_off_from_runway(subject)
      expect(ap.planes).not_to include [subject]
    end

    it "doesn't take off in a storm" do
      weather = double(:weather)
      allow(weather).to receive(:check_for_storm).and_return(true)
      subject.stormy?(weather)
      expect { subject.take_off }.to raise_error "Can't take off in a storm"
    end

    it "doesn't let flying planes take off" do
      subject.taken_off
      expect { subject.take_off }.to raise_error "Flying plane can't take off"
    end
  end
  describe '#plane status' do
    it 'checks plane is flying' do
      subject.taken_off
      expect(subject.flying?).to eq true
    end

    it 'checks plane is at the airport' do
      expect(subject.at_airport?).to eq true
    end
  end

end
