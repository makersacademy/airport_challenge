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
      it 'land a plane' do
        [plane, plane2, plane3].map { |p| subject.land(p) }
        expect(subject.airport_apron.last).to eq plane3
      end

      it 'not allow to land if the plane is already landed' do
        [plane, plane2, plane3].map { |p| subject.land(p) }
        expect { subject.land(plane2) }.to raise_error "Error, the plane arleady in apron"
      end
      
      it 'allow to land when airport_apron is not full' do
        (described_class::DEFAULT_CAPACITY - 1).times { subject.land(plane_example) }
        subject.land(plane)
        expect(subject.airport_apron.last).to eq plane
      end

      it 'rasie error if try to land when airport_apron is full' do
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
      it 'take off a plane and the first plane as default' do
        [plane, plane2, plane3].map { |p| subject.land(p) }
        expect(plane).to receive(:taken_off?)
        subject.take_off
      end

      it 'update the airport_apron stock' do
        allow(plane).to receive(:taken_off?)
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
