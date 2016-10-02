require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  let(:plane) { double(:plane, landed: nil, taken_off: nil) }

  describe "initialization" do

    it "defaults capacity" do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it "override capacity" do
      airport_capacity = described_class.new(55)
      expect(airport_capacity.capacity).to eq 55
    end

  end

  context "Scenario with good weather" do

    before (:each) do
      allow(airport).to receive(:storm?).and_return(false)
    end

    describe "#land" do

      it { is_expected.to respond_to(:land).with(1).arguments }

      it "returns a plane has been landed" do
        subject.land(plane)
        expect(subject.planes).to include plane
      end

      it "returns the plane is landing" do
          allow(plane).to receive(:landed)
          subject.land(plane)
      end

      it "No planes are allowed to land when the airport is full" do
        airport.capacity.times { airport.land(double(:plane, landed: nil)) }
        message = "The airport is full, the plane cannot land!!"
        expect{ subject.land(plane) }.to raise_error(message)
      end

    end

    describe "#takeoff" do

      it { is_expected.to respond_to(:takeoff).with(1).arguments }

      it "returns a plane has been taken off" do
        subject.land(plane)
        subject.takeoff(plane)
        expect(subject.planes).not_to include plane
      end

      it "raise an error if plane isn\'t at airport" do
        message = "Plane is not at the airport"
        expect { airport.takeoff(plane) }.to raise_error(message)
      end

      it "returns the plane take off" do
          airport.land(plane)
          expect(plane).to receive(:taken_off)
          airport.takeoff(plane)
        end
    end

  end

  context "Scenarion with storm weather" do

      before do
        allow(airport).to receive(:storm).and_return(true)
      end

      describe "#land" do

        it "returns no planes are allowed to land due to storm weather" do
          subject.land(plane)
          subject.stub(:storm?).and_return(0)
          expect{ subject.land(plane) }.to raise_error(RuntimeError, "Flight cancelled due to storm weather!")
        end

      end

      describe "#takeoff" do

        it "returns no planes are allowed to take off due to storm weather" do
          subject.land(plane)
          subject.stub(:storm?).and_return(0)
          expect{ subject.takeoff(plane) }.to raise_error(RuntimeError, "Flight cancelled due to storm weather!")
        end

      end

  end

end
