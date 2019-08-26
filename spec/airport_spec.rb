require 'airport'

describe Airport do
  let(:weather) { double :weather }
  let(:plane) { double :plane }

  it { should respond_to(:plane_array) }
  it { should respond_to(:takeoff).with(2).arguments }

  describe '#initialization' do

    it "It has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

  end

  describe "#takeoff" do

    it "expects the array not to include the plane that's just taken off" do
      allow(weather).to receive(:set_weather).and_return(true)
      10.times { Plane.new.land(subject, weather) }
      removed_plane = subject.plane_array[rand(9)]
      subject.takeoff(removed_plane, weather)
      expect(subject.plane_array).not_to include(removed_plane)
    end

    it "expects the plane not to take off if the weather is bad" do
      allow(weather).to receive(:set_weather).and_return(true)
      plane = Plane.new
      plane.land(subject, weather)
      allow(weather).to receive(:set_weather).and_return(false)
      expect { subject.takeoff(plane, weather) }.to raise_error 'Sorry - poor weather'
    end

    it "expects the plane not to take off if the plane isn't in the airport" do
      allow(weather).to receive(:set_weather).and_return(true)
      expect { subject.takeoff(plane, weather) }.to raise_error 'Sorry - this plane is not at the airport'
    end

  end

end
