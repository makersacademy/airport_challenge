require 'airport_challenge'
require 'plane'
require 'weather'

describe Airport do
  plane = Plane.new
  plane2 = Plane.new

  describe 'landing' do
    it "receives a landing plane" do
      allow(subject.weather).to receive(:stormy?) { false }
      expect(subject.land(plane)[0]).to eq plane
    end

    it "plane takes off and is gone from airport" do
      allow(subject.weather).to receive(:stormy?) { false }
      allow(subject).to receive(:landed?) { false }
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end

    it "blocks landing when airport at capacity" do
      allow(subject.weather).to receive(:stormy?) { false }
      allow(subject).to receive(:landed?) { false }
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error("This airport is full.")
    end

    it "keeps a record of all landed planes" do
      allow(subject.weather).to receive(:stormy?) { false }
      allow(subject).to receive(:landed?) { false }
      subject.land(plane)
      expect(Airport.landed_planes).to include plane
    end

    it "plane takes off and is gone from landed_planes" do
      allow(subject.weather).to receive(:stormy?) { false }
      allow(subject).to receive(:flying?) { false }
      allow(subject).to receive(:landed?) { false }
      subject.land(plane)
      subject.takeoff(plane)
      expect(Airport.landed_planes).not_to include plane
    end
  end
  context 'stormy' do
    it "prevents takeoff when weather is stormy" do
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.takeoff(plane) }.to raise_error("Too stormy.")
    end

    it "prevents landing when weather is stormy" do
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error("Too stormy.")
    end
  end

  describe '#edge cases' do

    it "planes can only take off from airports they are in" do
      allow(subject.weather).to receive(:stormy?) { false }
      allow(subject).to receive(:flying?) { false }
      expect { subject.takeoff(plane) }.to raise_error("Plane not in airport.")
    end

    it "planes in air cannot take off" do
      allow(subject.weather).to receive(:stormy?) { false }
      subject.land(plane2)
      subject.takeoff(plane2)
      expect { subject.takeoff(plane2) }.to raise_error("Plane in air.")
    end

    it "planes in air cannot be in an airport" do
      expect(Airport.landed_planes).not_to match_array(Airport.fly)
    end

    it "planes already in any airport cannot land" do
      allow(subject.weather).to receive(:stormy?) { false }
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Plane grounded elsewhere.")
    end
  end

  it 'stormy returns true or false' do
    expect(subject.weather.stormy?).to be(true).or be(false)
  end

end
