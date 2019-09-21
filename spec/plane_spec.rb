require 'plane'

describe Plane do
  let(:airport) { double(:airport, request_takeoff: :granted, request_landing: :granted) }
  let(:airport2) { double(:airport, request_takeoff: :granted) }
  describe '#flying?' do
    it 'can be flying' do
      subject.land(airport)
      subject.takeoff(airport)
      expect(subject).to be_flying
    end

    it 'can be landed' do
      subject.land(airport)
      expect(subject).to_not be_flying
    end
  end

  describe '#land' do
    it 'lands at an airport' do
      expect(subject.land(airport)).to eq airport
    end

    it "raises error if plane is already landed" do
      subject.land(airport)
      expect { subject.land(airport) } .to raise_error(RuntimeError, "Plane not flying")
    end

    it 'can be denied if airport is unsafe' do
      allow(airport).to receive(:request_landing) { raise "Not safe to land" }
      expect { subject.land(airport) } .to raise_error(RuntimeError, "Not safe to land")
    end
  end

  describe '#takeoff' do
    it 'releases plane from an airport' do
      subject.land(airport)
      expect(subject.takeoff(airport)).to eq nil
    end

    it "cannot take off from an airport it isn't landed at" do
      subject.land(airport)
      expect { subject.takeoff(airport2) }.to raise_error(RuntimeError, 'This plane is not landed there')
    end

    it 'cannot take off if it is already flying' do
      subject.land(airport)
      subject.takeoff(airport)
      expect { subject.takeoff(airport) }.to raise_error(RuntimeError, 'This plane is not landed there')
    end
  end
end
