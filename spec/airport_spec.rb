require 'airport'

describe Airport do
  let(:aeroplane) { double :aeroplane }

  describe ' #land' do

    it { is_expected.to respond_to :land }

    it 'lands aeroplane at airport' do
      subject.storm = false
      expect(subject.land(aeroplane)).to eq [aeroplane]
    end

    it "won't allow landing when stormy" do
      subject.storm = true
      expect { subject.land(aeroplane) }.to raise_error "Too stormy"
    end
  end

  describe ' #takeoff' do

    it { is_expected.to respond_to :takeoff }

    it 'makes aeroplane leave airport' do
      subject.land(aeroplane)
      subject.takeoff(aeroplane)
      expect(subject.aeroplanes).to eq []
    end

    it "won't allow takeoff when stormy" do
      subject.storm = true
      subject.aeroplanes = [aeroplane]
      expect { subject.takeoff(aeroplane) }.to raise_error "Too stormy"
    end
  end

  describe ' #check_aeroplane' do
    it 'checks if a plane is in the aeroport' do
      subject.land(aeroplane)
      expect(subject.aeroplanes).to eq [aeroplane]
    end
  end

  describe ' #initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(aeroplane)
      end
      expect { subject.land(aeroplane) }.to raise_error "#{described_class.name} full"
    end
  end

end
