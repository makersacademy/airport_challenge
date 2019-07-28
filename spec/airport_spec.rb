require 'airport'

describe Airport do

  describe "#land" do
    it "Add one plane to plane" do
      weather = 0
      random_flight_number = 'abc123'
      subject.land(random_flight_number, weather)
      expect(subject.include?(random_flight_number)).to eq true
    end

    it "prevent from landing in stormy weather" do
      weather = 1
      expect{subject.land("abc123", weather)}.to output.to_stdout
    end

    it "prevent from landing if airport is full" do
      weather = 0
      flight_list = ["abc123", "sdf123", "wer123"]
      flight_list.each{ |flight| subject.land(flight, weather) }
      expect{subject.land("abb123", weather)}.to output.to_stdout
    end

    it "Raise error when land a plane already in plane list" do
      weather = 0
      subject.land("abc123", weather)
      expect{subject.land("abc123", weather)}.to raise_error
    end
  end

  describe "#include?" do
    it "return true if plane list include the flight number" do
      weather = 0
      subject.land("abc123", weather)
      expect(subject.include?("abc123")).to eq(true)
    end
  end

  describe "#takeoff" do
    it "remove plane from the plane list" do
      weather = 0
      subject.land("abc123", weather)
      expect(subject.include?("abc123")).to eq(true)
      subject.takeoff("abc123", 0)
      expect(subject.include?("abc123")).to eq(false)
    end

    it "prevent from taking off in stormy weather" do
      # Stormy weather = 1, good weather = 0
      weather = 0
      subject.land("abc123", weather)
      weather = 1
      expect{subject.takeoff("abc123", weather)}.to output.to_stdout
    end

    it "prevent from taking off if flight not in airport" do
      weather = 0
      expect{subject.takeoff("abc123", weather)}.to output.to_stdout
    end
  end
end
