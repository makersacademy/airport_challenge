require 'airport'

describe Airport do

  before(:each) do
    @weather = double :weather
    @subject = described_class.new(weather)

    def plane_example
      plane = double :plane
      allow(plane).to receive(:land?)
      plane
    end

    @plane = plane_example
    @plane2 = plane_example
    @plane3 = plane_example
  end

  context "when is not stormy:" do

    attr_reader :weather, :subject, :plane, :plane2, :plane3

    before :each do
      allow(weather).to receive(:stormy?).and_return(false)
    end

    describe '#land' do

      before :each do
        allow(weather).to receive(:stormy?).and_return(false)
        [plane, plane2, plane3].map { |p| allow(p).to receive(:land?) }
      end

      it 'land a plane' do
        [plane, plane2, plane3].map { |p| subject.land(p) }
        expect(subject.airport_apron.last).to eq plane3
      end

      it 'allow to land when airport_apron is not full' do
        (described_class::DEFAULT_CAPACITY - 1).times { subject.land(plane_example) }
        subject.land(plane)
        expect(subject.airport_apron.last).to eq plane
      end

      it 'rasie error if try to land when airport_apron is full' do
        allow(weather).to receive(:stormy?).and_return(false)
        described_class::DEFAULT_CAPACITY.times { subject.land(plane_example) }
        expect { subject.land(plane_example) }.to raise_error "airport apron is full"
      end

      it 'allow to land when the reset capcity is not met yet' do
        capcity = rand(5..10)
        subject = described_class.new(weather, capcity)
        (capcity - 1).times { subject.land(plane_example) }
        subject.land(plane)
        expect(subject.airport_apron.last).to eq plane
      end

      it 'rasie error if try to land when is over the reset airport capacity' do
        capcity = rand(5..10)
        subject = described_class.new(weather, capcity)
        capcity.times { subject.land(plane_example) }
        expect { subject.land(plane_example) }.to raise_error "airport apron is full"
      end

    end

    describe '#take_off' do

      it 'take off a plane' do
        allow(weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:taken_off?).and_return(true)
        [plane, plane2, plane3].map { |p| subject.land(p) }
        taking_off_plane = subject.take_off
        expect(taking_off_plane.taken_off?).to eq true
      end

      it 'take off the frist plane' do
        allow(weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:taken_off?).and_return(true)
        [plane, plane2, plane3].map { |p| subject.land(p) }
        expect(subject.take_off).to eq plane
      end

      it 'update the airport_apron stock' do
        allow(weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:taken_off?).and_return(true)
        [plane, plane2, plane3].map { |p| subject.land(p) }
        subject.take_off
        expect(subject.airport_apron.size).to eq 2
      end
    end
  end

  context "when stormy:" do
    attr_reader :weather, :subject, :plane
    before :each do
      allow(weather).to receive(:stormy?).and_return(true)
    end

    describe '#land' do
      it "prevent land" do
        expect { subject.land(plane) }.to raise_error "it is stormy"
      end
    end

    describe '#take_off' do
      it "prevent takeoff" do
        expect { subject.take_off }.to raise_error "it is stormy"
      end
    end
  end
end
