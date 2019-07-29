require 'airport'
require 'plane'

describe Airport do

  describe "#land" do
    let(:random_plane) {double("plane")}
    it "Add one plane to plane" do
      weather = 0
      subject.land(random_plane, weather)
      expect(subject.include?(random_plane)).to eq true
    end

    it "prevent from landing in stormy weather" do
      weather = 1
      expect{subject.land(random_plane, weather)}.to output.to_stdout
    end

    it "prevent from landing if airport is full" do
      weather = 0
      plane1 = double
      plane2 = double
      plane3 = double
      plane4 = double
      flight_list = [plane1, plane2, plane3]
      flight_list.each{ |flight| subject.land(flight, weather) }
      expect{subject.land(plane4, weather)}.to output.to_stdout
    end

    it "Raise error when land a plane already in plane list" do
      weather = 0
      plane1 = double
      subject.land(plane1, weather)
      expect{subject.land(plane1, weather)}.to raise_error
    end
  end

  describe "#include?" do
    let(:random_plane){double}
    it "return true if plane list include the flight number" do
      weather = 0
      subject.land(random_plane, weather)
      expect(subject.include?(random_plane)).to eq(true)
    end
  end

  describe "#takeoff" do
    let(:random_plane){double}
    it "remove plane from the plane list" do
      weather = 0
      subject.land(random_plane, weather)
      expect(subject.include?(random_plane)).to eq(true)
      subject.takeoff(random_plane, 0)
      expect(subject.include?(random_plane)).to eq(false)
    end

    it "prevent from taking off in stormy weather" do
      # Stormy weather = 1, good weather = 0
      weather = 0
      subject.land(random_plane, weather)
      weather = 1
      expect{subject.takeoff(random_plane, weather)}.to output.to_stdout
    end

    it "prevent from taking off if flight not in airport" do
      weather = 0
      expect{subject.takeoff(random_plane, weather)}.to output.to_stdout
    end
  end
end
