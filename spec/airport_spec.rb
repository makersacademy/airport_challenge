require 'airport'

describe Airport do
  let(:plane) { double :plane }
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  it "allows a user to set a capacity" do
    expect(Airport.new(15).capacity).to eq 15
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#land" do
    context 'when it is not stormy' do

      before do
        allow(subject).to receive(:weather_stormy?).and_return(false)
      end

      it "returns a message saying plane has landed" do
        expect(subject.land(plane)).to eq "Plane has landed"
      end

      it "adds the plane to the hangar" do
        subject.land(plane)
        expect(subject.hangar).not_to be_empty
      end

      it "throws an error message if plane is already in hangar" do
        subject.land(plane)
        expect(subject.land(plane)).to eq "Error: Plane is already in hangar"
      end

      it "throws an error if try to land when airport is full" do
        subject.capacity.times { subject.land(Plane.new) }
        expect(subject.land(Plane.new)).to eq "Can't land: Airport full"
      end

    end

    context 'when it is stormy' do

      before do
        allow(subject).to receive(:weather_stormy?).and_return(true)
      end

      it 'throws an error message when asked to land' do
        expect(subject.land(plane)).to eq "Can't land: weather stormy"
      end
    end
  end

  describe "#take_off" do

    context 'when it is not stormy' do
      before do
        allow(subject).to receive(:weather_stormy?).and_return(false)
      end

      it "throws an error message if plane is not in hangar" do
        subject.take_off(plane)
        expect(subject.take_off(plane)).to eq "Error: Plane is not in hangar"
      end

      it "returns a message saying plane has taken off" do
        subject.land(plane)
        expect(subject.take_off(plane)).to eq "Plane has taken off"
      end
    end

    context 'when it is stormy' do

      it 'throws an error message when asked to take off' do
        allow(subject).to receive(:weather_stormy?).and_return(false)
        subject.land(plane)
        allow(subject).to receive(:weather_stormy?).and_return(true)
        expect(subject.take_off(plane)).to eq "Can't take off: weather stormy"
      end
    end
  end
end
