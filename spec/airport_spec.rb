require 'airport'

describe Airport do
  let(:plane) {double(:plane)}

  before(:each) do
    allow(subject).to receive(:stormy?).and_return(false)
  end

  it "checks for stormy weather" do
    expect(subject).to respond_to(:stormy?)
  end

  describe "#land" do

    it "instructs a plane to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "confirms the plane is in the airport" do
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it "wont allow a plane to land when the airport is full" do
      Airport::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect{subject.land(plane)}.to raise_error "The airport is full, you must wait."
    end

    context "when stormy" do

      it "won't allow a plane to land when stormy" do
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.land(plane)}.to raise_error("It isn't safe to land.")
      end
    end
  end

  describe "#take-off" do

    it "instructs a plane to take off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "confirms the plane is airborne" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it "raises error when there are no planes avaliable." do
      expect{subject.take_off(plane)}.to raise_error("There are no planes in the airport.")
    end

    context "when stormy" do
      it "won't allow a plane to take off when stormy" do
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.take_off(plane)}.to raise_error("It isn't safe to fly.")
      end
    end
  end

  describe "capacity" do
    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "has an adjustable capacity" do
      airport = Airport.new(30)
      Airport::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect{subject.land(plane)}.to raise_error("The airport is full, you must wait.")
    end
  end
end
