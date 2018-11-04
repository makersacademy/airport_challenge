require 'airport'

describe Airport do

  let(:aeroplane_landed) { double :aeroplane, airport: subject, takeoff: 'flying', land: subject, flying: false }
  let(:aeroplane) { double :aeroplane, flying: true, airport: subject, land: subject, takeoff: 'flying' }
  let(:aeroplane_other) { double :aeroplane, airport: Airport.new(21) }

  describe ' #land' do

    it { is_expected.to respond_to :land }

    it 'lands aeroplane at airport' do
      subject.storm = false
      expect(subject.land(aeroplane)).to eq subject
    end

    it "won't allow landing when stormy" do
      subject.storm = true
      expect { subject.land(aeroplane) }.to raise_error "Too stormy"
    end

    it 'can only land a plane that is flying' do
      subject.storm = false
      expect { subject.land(aeroplane_landed) }.to raise_error 'Plane already landed'
    end
  end

  describe ' #takeoff' do

    it { is_expected.to respond_to :takeoff }

    it 'makes aeroplane leave airport' do
      subject.storm = false
      subject.land(aeroplane)
      subject.takeoff(aeroplane)
      expect(subject.aeroplanes).to eq []
    end

    it "won't allow takeoff when stormy" do
      subject.storm = true
      subject.aeroplanes = [aeroplane]
      expect { subject.takeoff(aeroplane) }.to raise_error "Too stormy"
    end

    it "can't takeoff if not in airport" do
      subject.storm = false
      expect { subject.takeoff(aeroplane_other) }.to raise_error "Aeroplane not at airport"
    end
  end

  describe ' #capacity' do

    it "capacity can be changed" do
      larger_airport = Airport.new(21)
      larger_airport.storm = false
      21.times { larger_airport.land(aeroplane) }
      expect { larger_airport.land(aeroplane_other) }.to raise_error "#{described_class.name} full"
    end

    it "defaults capacity of #{described_class::DEFAULT_CAPACITY}" do
      subject.storm = false
      described_class::DEFAULT_CAPACITY.times do
        subject.land(aeroplane)
      end
      expect { subject.land(aeroplane) }.to raise_error "#{described_class.name} full"
    end

  end
end
