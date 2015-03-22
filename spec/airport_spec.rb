require "airport"

describe Airport do

  let(:plane) { double(:plane) }
  let(:plane_arrival) { subject.arrival(plane) }
  let(:plane_depature) { subject.departure }

  before { allow(subject).to receive(:stormy?) { false } }
  before { allow(plane).to receive(:land) { plane } }
  before { allow(plane).to receive(:take_off) { plane } }

  context "taking off and landing" do

    it "a plane can land" do
      plane_arrival
      expect(subject.stationed_planes.last).not_to eq nil
    end

    it "a plane can take off" do
      plane_arrival
      plane_depature
      expect(subject.stationed_planes.last).to eq nil
    end

  end

  context "traffic control" do

    it "a plane cannot land if the airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.arrival(plane) }
      expect { plane_arrival }. to raise_error "Airport Full"
    end

    it "can set a custom capacity" do
      random_capacity = rand(1..100)
      airport = Airport.new(capacity: random_capacity)
      expect(airport.capacity).to eq random_capacity
    end

    it "a plane cannot take off if it is not present" do
      plane_arrival
      plane_depature
      expect { subject.departure(plane) }.to raise_error "No plane"
    end

  end

  context "weather conditions" do

    it "a plane cannot take off when there is a storm brewing" do
      plane_arrival
      allow(subject).to receive(:stormy?) { true }
      expect { plane_depature }.to raise_error "Too Stormy"
    end

    it "a plane cannot land in the middle of a storm" do
      allow(subject).to receive(:stormy?) { true }
      expect { plane_arrival }.to raise_error "Too Stormy"
    end

  end

end
