require_relative '../lib/airport'

describe Airport do

  it "initializes with preset capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "initializes with an empty hangar" do
    expect(subject.hangar).to eq []
  end


  describe "when a plane lands" do

      it "it is landed" do
        plane = Plane.new
        allow(subject).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:status).and_return(:landed)
        subject.land_plane(plane)
        expect(plane.status).to eq (:landed)
      end

      it "it is added to the hangar" do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.land_plane(Plane.new)
        expect(subject.hangar).not_to eq []
      end
  end


  describe "when a plane takes off" do

      it "it is flying" do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.hangar = [Plane.new]  # bypass fail on first line of land_plane
        plane = Plane.new
        allow(plane).to receive(:status).and_return(:flying)
        subject.plane_take_off(plane)
        expect(plane.status).to eq(:flying)
      end

      it "it is removed from the hangar" do
        allow(subject).to receive(:stormy?).and_return(false)
        plane = Plane.new
        subject.hangar = [plane]
        subject.plane_take_off(plane)
        expect(subject.hangar).to eq []
      end
  end


  describe 'traffic control' do

      it "planes cannot land if the hangar is full" do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.capacity.times {subject.land_plane(Plane.new)}
        expect{subject.land_plane(Plane.new)}.to raise_error "unable to land"
      end

      it "planes cannot leave if the hangar is empty" do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.hangar = []
        expect{subject.plane_take_off(Plane.new)}.to raise_error "unable to take off"
      end

    context "when weather conditions are stormy" do

      it "does not allow planes to land" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect {subject.land_plane(Plane.new)}.to raise_error "unable to land"
      end

      it "does not allow planes to take off" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect {subject.plane_take_off(Plane.new)}.to raise_error "unable to take off"
      end
    end
  end
end
