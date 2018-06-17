# don't think I'm testing specified capacity requirement

require 'airport'

describe Airport do

  it { should respond_to(:land).with(1).argument }

  it { should respond_to(:take_off).with(1).argument }

  it 'should have a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'should create an empty hangar' do
    expect(subject.hangar).to eq []
  end

  describe '#land' do

    context "when it is not stormy" do
      it "should store landed plane" do
        allow(subject).to receive(:stormy?) {false}
        plane = double(:plane, in_hangar?: false, in_hanger: false, land: false)
        subject.land(plane)
        expect(subject.hangar).to eq [plane]
      end

      context "when plane has already landed" do
        it "should raise an error" do
          plane = double(:plane, in_hangar?: true, land: false)
          expect { subject.land(plane) }.to raise_error "Plane already at airport"
        end
      end

      context "when the hangar's default capacity has been exceeded" do
        it 'should raise an error' do
          allow(subject).to receive(:stormy?) {false}
          plane = double(:plane, in_hangar?: false, land: false)
          Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
          expect { subject.land(plane) }.to raise_error "Hangar is full"
        end
      end

    end

    context "when it is too stormy" do
      it "should raise an error" do
        allow(subject).to receive(:stormy?) { true }
        plane = double(:plane, in_hangar?: false)
        expect { subject.land(plane) }.to raise_error "Too stormy to land"
      end
    end

  end

  describe '#take_off' do

    it "should remove plane from the hangar" do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane, in_hangar?: true, take_off: false)
      subject.take_off(plane)
      expect(subject.hangar). to eq []
    end

    it "should confirm that plane has left the airport" do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane, in_hangar?: true, take_off: true)
      expect(subject.take_off(plane)).to eq "#{plane} has left the airport"
    end

    context "when a plan tries to take off but is not at the airport" do
      it "should raise an error" do
        plane = double(:plane, in_hangar?: false)
        expect { subject.take_off(plane) }.to raise_error "Plane not at airport"
      end
    end

    context "when it is too stormy" do
      it "should raise an error" do
        allow(subject).to receive(:stormy?) { true }
        plane = double(:plane, in_hangar?: true)
        expect { subject.take_off(plane) }.to raise_error "Too stormy to take off"
      end
    end

  end

  describe '#stormy?' do
    it 'should return true if stormy' do
      allow(subject).to receive(:weather).and_return(0)
      expect(subject.stormy?).to eq true
    end
  end

end
