require 'airport'

describe Airport do

  it { should respond_to(:land).with(1).argument }

  it { should respond_to(:take_off).with(1).argument }

  it 'should have a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'should have a specified capacity' do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
  end

  it 'should create an empty hangar' do
    expect(subject.hangar).to eq []
  end

  describe '#land' do

    context "when it is not stormy" do
      it "should store plane in hangar" do
        allow(subject).to receive(:stormy?) { false }
        plane = double(:plane)
        subject.land(plane)
        expect(subject.hangar).to eq [plane]
      end

      context "when plane is already in hangar" do
        it "should raise an error" do
          allow(subject).to receive(:stormy?) { false }
          plane = double(:plane)
          subject.land(plane)
          expect { subject.land(plane) }.to raise_error "Plane already at airport"
        end
      end

      context "when the hangar is full" do
        it 'should raise an error' do
          # unsure how to replace Plane.new with a double here as
          # it has to be a new instance each time
          allow(subject).to receive(:stormy?) { false }
          Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
          expect { subject.land(Plane.new) }.to raise_error "Hangar is full"
        end
      end

    end

    context "when it is stormy" do
      it "should raise an error" do
        allow(subject).to receive(:stormy?) { true }
        plane = double(:plane)
        expect { subject.land(plane) }.to raise_error "Too stormy to land"
      end
    end

  end

  describe '#take_off' do

    context 'when it is not stormy' do
      it "should remove plane from hangar" do
        allow(subject).to receive(:stormy?) { false }
        plane = double(:plane)
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.hangar). to eq []
      end

      context "when plane is not in hangar" do
        it "should raise an error" do
          plane = double(:plane)
          expect { subject.take_off(plane) }.to raise_error "Plane not at airport"
        end
      end

      it "should confirm that plane has left the airport" do
        allow(subject).to receive(:stormy?) { false }
        plane = double(:plane)
        subject.land(plane)
        expect(subject.take_off(plane)).to eq "#{plane} has left the airport"
      end
    end

    context "when it is stormy" do
      it "should raise an error" do
        plane = double(:plane)
        allow(subject).to receive(:stormy?) { false }
        subject.land(plane)
        allow(subject).to receive(:stormy?) { true }
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
