require 'air_controller'

describe Airport do

    subject(:airport) {described_class.new}
    let(:weather) { double :weather}
    let(:plane)  { double :plane}


  describe "a group of tests that raise errors during bad weather" do
    before do
      allow(subject).to receive(:bad_weather?).and_return true
    end

    context "Tests for exceptions due to bad weather" do

      it "landing should not be possible during bad weather" do
        allow(plane).to receive(:report_landing)
        expect{subject.land_plane(plane)}.to raise_error("Landing not possible - bad weather!")
      end

      it "take off should not be possible during bad weather" do
        expect{subject.take_off_plane}.to raise_error("Take off not possible - bad weather!")
      end

    end

  end

  describe "a group of tests for good weather" do
    before do
      allow(airport).to receive(:bad_weather?).and_return false
    end
    context "Confirming a plane has taken off and landed" do

      it "a plane that has taken off should return true for taken_off?" do
        allow(plane).to receive(:report_take_off)
        allow(plane).to receive(:report_landing)
        allow(plane).to receive(:taken_off?).and_return true
        subject.land_plane(plane)
        plane = airport.take_off_plane
        expect(plane.taken_off?).to eq true
      end

      it "landed planes should return true for landed?" do
        allow(plane).to receive(:report_landing).and_return(true)
        allow(plane).to receive(:landed?).and_return(true)
        expect(plane.landed?).to eq true
      end

    end

    context "Test for exceptions due to airport capacity" do

      it "should raise an error if you try to take_off a plane when the airport is empty" do
        subject.take_off_plane
        expect{subject.take_off_plane}.to raise_error("There are no planes in the airport")
      end


      it "should raise an error if you try to land a plane when the airport is full" do
        subject.take_off_plane
        capacity = Airport::DEFAULT_CAPACITY
        capacity.times {subject.land_plane(Plane.new)}
        expect{subject.land_plane(plane)}.to raise_error("The airport is full!")
      end

    end

    context "Tests for setting airport capacity" do

      it "should be able to set an airports capity" do
        new_capacity = 100
        new_airport = Airport.new(new_capacity)
        expect(new_airport.capacity).to eq new_capacity
      end

      it "if no capacity is given, then airport capacity is equal to a DEFAULT_CAPACITY" do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

    end

    context "Edge cases" do

      it "a plane that is already in the airport cannot be landed" do
        allow(plane).to receive(:report_landing)
        subject.land_plane(plane)
        expect{subject.land_plane(plane)}.to raise_error("This plane has already landed!")
      end

      it "a plane that has taken off cannot still be in the airport it left" do
        allow(plane).to receive(:report_take_off)
        allow(plane).to receive(:report_landing)
        subject.land_plane(plane)
        take_off = subject.take_off_plane
        expect{subject.take_off_plane(take_off)}.to raise_error("This plane has already taken off!")
      end

    end

  end

end
