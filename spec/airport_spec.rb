require 'airport'

describe Airport do
  let(:plane) {double :plane}

  it "raises an error when airport is full" do
    Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
    expect{subject.land(plane)}.to raise_error "Airport is full."
  end

  describe "#land" do

    it "returns a message if a plane has landed" do
      expect(subject.land(plane)).to eq "You have landed plane: #{plane}"
    end

    it "raises an error if trying to land in a storm" do
      airport1 = Airport.new
      airport1.weather_report
      expect{airport1.land(plane)}.to raise_error "You cannot land in a storm."
    end

  end


  describe "#take_off" do

    it "cannot let a plane take off if it isn't in the hanger" do
      expect{subject.take_off}.to raise_error "The hanger is empty."
    end

    it "returns a message when the plane has taken off" do
      subject.land(plane)
      expect(subject.take_off).to eq "The flight now leaving is: #{plane}"
    end

    it "raises an error if trying to take off in a storm" do
      airport1 = Airport.new
      airport1.land(plane)
      airport1.weather_report
      expect{airport1.take_off}.to raise_error "You cannot take off in a storm."
    end

  end

end
