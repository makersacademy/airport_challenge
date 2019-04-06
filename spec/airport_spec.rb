require 'airport'

describe Airport do

  before(:each) do
    @weather = double :weather
    @subject = described_class.new(weather)
    @plane = double :plane
  end

  context "when is not stormy:" do
    attr_reader :weather, :subject, :plane

    describe '#land' do
      it 'land a plane' do
        expect(subject.land(plane)).to eq plane
      end
    end

    describe '#take_off' do

      it 'take off a plane' do
        allow(weather).to receive(:stormy).and_return(false)
        allow(plane).to receive(:taken_off?).and_return(true)
        subject.land(plane)
        taken_off_plane = subject.take_off
        expect(taken_off_plane.taken_off?).to eq true
      end
    end
  end

  context "when stormy:" do
    attr_reader :weather, :subject, :plane

    describe '#take_off' do
      it "prevent takeoff" do
        allow(weather).to receive(:stormy).and_return(true)
        expect { subject.take_off }.to raise_error "it is stormy"
      end
    end
  end

end
