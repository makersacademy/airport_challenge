require_relative "../lib/airport"
require_relative "../lib/plane"

describe Airport do
  before do
    allow(subject).to receive(:stormy?) { false }
  end

  describe "#land_a_plane" do
    it "lands plane at an airport" do
      plane = Plane.new
      subject.land_a_plane(plane)
      expect(subject.planes).to include(plane)
    end

    it "raises error when full" do
      Airport::DEFAULT_CAPACITY.times { subject.land_a_plane Plane.new }
      expect { subject.land_a_plane Plane.new }.to raise_error 'Airport is full'
    end

    describe 'when with custom capacity' do
      subject { Airport.new(capacity: 200) }

      it "raises error when full" do
        200.times { subject.land_a_plane Plane.new }
        expect { subject.land_a_plane Plane.new }.to raise_error 'Airport is full'
      end
    end

    it "prevents landing when weather is stormy" do
      plane = Plane.new
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land_a_plane(plane) }.to raise_error "Weather is stormy"
    end
  end

  describe "#take_off" do
    it "plane takes off" do
      plane = Plane.new
      subject.land_a_plane(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it "prevents take off when weather is stormy" do
      plane = Plane.new
      subject.land_a_plane(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error "Weather is stormy"
    end
  end

  describe "#has_plane?" do
    it "plane took off" do
      plane = Plane.new
      subject.land_a_plane(plane)
      subject.take_off(plane)
      expect(subject.has_plane?(plane)).to be false
    end
  end
end
