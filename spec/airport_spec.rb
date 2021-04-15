require 'airport_challenge'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { double 'plane' }
  let(:plane2) {double 'plane'}
  let(:weather) {double 'weather' }
  subject { described_class.new(weather: weather)}

  describe 'landing' do
    before do
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:grounded?).and_return(false)
      allow(plane).to receive(:takeoff)
    end

    it "receives a landing plane" do
      # allow(weather).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to eq [plane]
    end

    it "plane takes off and is gone from airport" do
      # allow(weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      # allow(weather).to receive(:stormy?).and_return(false)
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end

    it "blocks landing when airport at capacity" do
      # allow(subject.weather).to receive(:stormy?) { false }
      # allow(subject).to receive(:landed?) { false }
      # subject.capacity.times { subject.land(plane) }
      # expect { subject.land(plane) }.to raise_error("This airport is full.")
    end

    it "keeps a record of all landed planes" do
      # allow(subject.weather).to receive(:stormy?) { false }
      # allow(subject).to receive(:landed?) { false }
      # subject.land(plane)
      # expect(Airport.landed_planes).to include plane
    end

    it "plane takes off and is gone from landed_planes" do
      # allow(subject.weather).to receive(:stormy?) { false }
      # allow(subject).to receive(:flying?) { false }
      # allow(subject).to receive(:landed?) { false }
      # subject.land(plane)
      # subject.takeoff(plane)
      # expect(subject.landed_planes).not_to include plane
    end
  end
  context 'stormy' do
    it "prevents takeoff when weather is stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:takeoff)
      expect { subject.takeoff(plane) }.to raise_error("Too stormy.")
    end

    it "prevents landing when weather is stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:grounded?)
      expect { subject.land(plane) }.to raise_error("Too stormy.")
    end
  end

  describe '#edge cases' do

    # it "planes can only take off from airports they are in" do
    #   allow(subject.weather).to receive(:stormy?) { false }
    #   allow(subject).to receive(:flying?) { false }
    #   expect { subject.takeoff(plane) }.to raise_error("Plane not in airport.")
    # end

    # it "planes in air cannot take off" do
    #   allow(subject.weather).to receive(:stormy?) { false }
    #   subject.land(plane2)
    #   subject.takeoff(plane2)
    #   expect { subject.takeoff(plane2) }.to raise_error("Plane in air.")
    # end

    # it "planes in air cannot be in an airport" do
    #   expect(subject.landed_planes).not_to match_array(Airport.fly)
    # end

    # it "planes already in any airport cannot land" do
    #   allow(subject.weather).to receive(:stormy?) { false }
    #   subject.land(plane)
    #   expect { subject.land(plane) }.to raise_error("Plane grounded elsewhere.")
    # end
  end

  # it 'stormy returns true or false' do
  #   expect(subject.weather.stormy?).to be(true).or be(false)
  # end

end
