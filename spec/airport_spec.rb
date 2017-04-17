require "airport"

describe Airport do

  subject(:airport){ described_class.new }
  let(:plane){ Plane.new}
  let(:stormy_weather){double(:weather, stormy?: true)}
  let(:fine_weather){double(:weather, stormy?: false)}
  let(:airport_stormy){Airport.new(Airport::DEFAULT_CAPACITY, stormy_weather)}
  let(:airport_fine){Airport.new(Airport::DEFAULT_CAPACITY, fine_weather)}

  context "status of the airport" do

    it {is_expected.to respond_to :full?}

    it "when initialized the current weather is set" do
      expect(subject.weather).to_not be_nil
    end

    it "when initialized it has default capacity" do
      expect(subject.capacity).to be described_class::DEFAULT_CAPACITY
    end

    it "became full when amount of planes equaled capacity" do
      Airport::DEFAULT_CAPACITY.times{airport_fine.land(Plane.new)}
      expect(airport_fine.full?).to eq true
    end

  end

  describe "instruct plan to #land" do

    it {is_expected.to respond_to :land}

    it "- give a confirmation that particular plane landed" do
      expect(airport_fine.land(plane)).to eq "#{plane} has landed"
    end

    it "- keeps info about landed planes" do
      airport_fine.land(plane)
      expect(airport_fine.planes).to eq [plane]
    end

    it "- prevent plane to land if weather is stormy" do
      message = "Storm!Landing is not allowed!"
      expect{airport_stormy.land(plane)}.to raise_error message
    end

    it "- prevent plane to land if airport is full" do
      Airport::DEFAULT_CAPACITY.times{airport_fine.land(Plane.new)}
      message = "Landing is not allowed! Airport is full!"
      expect{airport_fine.land(plane)}.to raise_error message
    end

    it "- prevent land plane which is already in the airport" do
      plane.land
      message = "This plane is already in the airport!"
      expect{airport_fine.land(plane)}.to raise_error message
    end


  end

  describe "instruct plan to #takeoff" do

    it {is_expected.to respond_to :takeoff}

    it "- give a confirmation that particular plane took off" do
      airport_fine.land(plane)
      expect(airport_fine.takeoff(plane)).to eq "#{plane} has taken off"
    end

    it "- update it's info about plane if it took off" do
      plane1 = Plane.new
      airport_fine.land(plane)
      airport_fine.land(plane1)
      airport_fine.takeoff(plane)
      expect(airport_fine.planes).to eq [plane1]
    end

    it "- prevent plane to take off if weather is stormy" do
      message = "Storm!Takeoff is not allowed!"
      expect{airport_stormy.takeoff(plane)}.to raise_error message
    end

    it "- prevent taken off plane which is not in this airport" do
      message = "This plane is not in the airport!"
      expect{airport_fine.takeoff(plane)}.to raise_error message
    end

    it "- prevent taken off plane which is flying already" do
      airport_fine.land(plane)
      plane.fly
      message = "This plane is already in the air!"
      expect{airport_fine.takeoff(plane)}.to raise_error message
    end

  end

end