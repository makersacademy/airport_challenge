require 'airport'

describe Airport do

  let(:Weather) {double :Weather}
  let(:plane) {double :plane}
  let(:act_weather) {double :act_weather}

  before(:each) do
    allow(plane).to receive(:take_off).and_return(true)
    allow(plane).to receive(:land).and_return(true)
    allow(Weather).to receive(:new).and_return(act_weather)
  end

  describe "initialize" do
    it "has a default capacity when initialized" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "can be override capacity" do
      random_capacity = Random.rand(75)
      airport = described_class.new(random_capacity)
      expect(airport.capacity).to eq random_capacity
    end
  end

  describe "let_plane_to_take_off" do

    it "responds to the method call" do
      expect(subject).to respond_to(:let_plane_to_take_off).with(1).arguments
    end

    it "lets a plane to take off from the airport in sunny weather" do
      allow(act_weather).to receive(:sunny?).and_return true
      subject.let_plane_to_land(plane)
      expect(subject.let_plane_to_take_off(plane)).to eq("The plane has left the airport")
    end

    it "doesn't let a plane to take off in stormy weather" do
      allow(act_weather).to receive(:sunny?).and_return(true)
      subject.let_plane_to_land(plane)
      allow(act_weather).to receive(:sunny?).and_return(false)
      expect{subject.let_plane_to_take_off(plane)}.to raise_error
    end

    it "doesn't let the plane to take off if it's not at this airport" do
      allow(act_weather).to receive(:sunny?).and_return(true)
      expect{subject.let_plane_to_take_off(plane)}.to raise_error("Plane is not at the airport")
    end

  end

  describe "let_plane_to_land" do

    it "responds to the method call" do
      expect(subject).to respond_to(:let_plane_to_land).with(1).arguments
    end

    it "lets a plane to land in sunny weather" do
      allow(act_weather).to receive(:sunny?).and_return(true)
      expect(subject.let_plane_to_land(plane)).to eq("The plane has landed")
    end

    it "doesn't let a plane to land in stormy weather" do
      allow(act_weather).to receive(:sunny?).and_return(false)
      expect{subject.let_plane_to_land(plane)}.to raise_error
    end

    it "doesn't let a plane to land if the airport if full" do
      allow(act_weather).to receive(:sunny?).and_return(true)
      subject.capacity.times { subject.let_plane_to_land(plane)}
      expect{subject.let_plane_to_land(plane)}.to raise_error("Airport is full, plane cannot land at this airport")
    end

  end

end
