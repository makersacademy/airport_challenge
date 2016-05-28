require 'airport'

describe Airport do

  let (:plane) {double :plane}
  let (:good_weather) {double :weather, is_stormy?: false}
  let (:bad_weather) {double :weather, is_stormy?: true}

  context "good weather" do

    describe "#dock" do
      it "docks planes during good weather" do
        subject = Airport.new(good_weather)
        plane1 = plane
        subject.dock(plane1)
        expect(subject.release).to eq plane1
      end
    end

    describe "#release" do
      it "releases planes during good weather" do
        subject = Airport.new(good_weather)
        plane1 = plane
        subject.dock(plane1)
        expect(subject.release).to eq plane1
      end
    end

    describe "#capacity" do
      it "returns an error if over default capcity" do
        subject = Airport.new(good_weather)
        20.times{subject.dock(plane)}
        expect{subject.dock(plane)}.to raise_error "Airport is full, cannot land"
      end

      it "returns an error if over set capacity" do
        subject = Airport.new(good_weather, 10)
        10.times{subject.dock(plane)}
        expect{subject.dock(plane)}.to raise_error "Airport is full, cannot land"
      end
    end
  end

  context "bad weather" do

    describe "#dock" do
      it "returns error during bad weather" do
        subject = Airport.new(bad_weather)
        plane1 = plane
        expect{subject.dock(plane1)}.to raise_error "Weather is too stormy, cannot land"
      end
    end

    describe "#release" do
      it "returns error during bad weather" do
        subject = Airport.new(bad_weather)
        expect{subject.release}.to raise_error "Weather is too stormy, cannot take off"
      end
    end
  end
end
