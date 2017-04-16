require 'airport'

describe Airport do
  let(:plane) {double :plane, in_flight: true, landed: (), departed: ()}
  let(:bad_weather) {double :weather, stormy?: true}
  let(:good_weather) {double :weather, stormy?: false}

  it "raises an error when airport is full" do
    subject = Airport.new(good_weather)
    Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
    expect{subject.land(plane)}.to raise_error "Airport is full."
  end

  describe "#land" do

    it "returns a message if a plane has landed" do
      subject = Airport.new(good_weather)
      expect(subject.land(plane)).to eq "You have landed plane: #{plane}"
    end

    it "raises an error if trying to land in a storm" do
      subject = Airport.new(bad_weather)
      expect{subject.land(plane)}.to raise_error "You cannot land in a storm."
    end

    it "raises an error if a plane has already landed" do
      subject = Airport.new(good_weather)
      plane1 = plane
      expect(plane1).to receive(:in_flight).and_return(false)
      expect{subject.land(plane1)}.to raise_error "Plane has already landed."
    end

    it "changes planes to landed" do
      subject = Airport.new(good_weather)
      plane1 = plane
      expect(plane1).to receive(:landed)
      subject.land(plane1)
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
      subject = Airport.new(bad_weather)
      expect{subject.take_off}.to raise_error "You cannot take off in a storm."
    end


  end

end
