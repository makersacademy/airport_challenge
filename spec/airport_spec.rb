require "airport.rb"
require "plane.rb"
require "weather.rb"

describe Airport do

  let(:landed_plane) { double :Plane, :status => "arrived" }
  let(:departed_plane) { double :Plane, :status => "departed" }

  describe '#land' do
    it "has a land method with one argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "lands a plane at the airport" do
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      allow(departed_plane).to receive(:status_arrived).and_return("arrived")
      subject.land(departed_plane)
      expect(subject.planes).to include(departed_plane)
    end

    it "cannot land a plane that has already landed" do
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      expect { subject.land(landed_plane) }.to raise_error("Plane has already landed")
    end

    it "cannot land a plane that isn't in the air" do
      plane = Plane.new
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      expect { subject.land(plane) }.to raise_error("Plane is not in the air")
    end

    it "cannot land a plane when the airport is full" do
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      allow(departed_plane).to receive(:status_arrived).and_return("arrived")
      Airport::DEFAULT_CAPACITY.times { subject.land(departed_plane) }
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      expect { subject.land(departed_plane) }.to raise_error("Cannot land, this airport is full")
    end

    it "raises an error when weather is stormy" do
      plane = Plane.new
      allow(subject).to receive(:check_current_weather).and_return("stormy")
      expect { subject.land(plane) }.to raise_error("Cannot land in stormy weather")
    end

  end

  describe '#confirm_status' do
    it "confirms the status of the plane" do
      plane = Plane.new
      expect(subject.confirm_status(plane)).to eq(nil)
    end

    it "confirms that the plane has landed/arrived" do
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      allow(departed_plane).to receive(:status_arrived).and_return("arrived")
      subject.land(departed_plane)
      expect(subject.confirm_status(departed_plane)).to eq("arrived")
    end

    it "confirms that the plane has departed" do
      plane = Plane.new
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      subject.land(plane)
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      subject.take_off(plane)
      expect(subject.confirm_status(plane)).to eq("departed")
    end
  end

  describe '#take_off' do
    it "instructs a plane to take off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "confirms the plane is no longer in the airport" do
      plane = Plane.new
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      subject.land(plane)
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it "raises error when a plane is not in the airport" do
      plane = Plane.new
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      expect { subject.take_off(plane) }.to raise_error("this plane is not available for take off or has already left")
    end

    it "raises an error when weather is stormy" do
      plane = Plane.new
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      subject.land(plane)
      allow(subject).to receive(:check_current_weather).and_return("stormy")
      expect { subject.take_off(plane) }.to raise_error("Cannot take off in stormy weather")
    end
  end

  describe '#full?' do
    it "can check if the aiport is full" do
      allow(subject).to receive(:check_current_weather).and_return("sunny")
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect(subject.full?).to eq true
    end
  end
end
