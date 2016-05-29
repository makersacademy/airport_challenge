require 'airport'

describe Airport do
  let(:plane) {double :plane}
  let(:bad_weather) {double :weather, stormy?: true }
  let(:good_weather) {double :weather, stormy?: false}

  it "raises an error when airport is full" do
    good_weather
    10.times {subject.land(plane)}
    expect{subject.land(plane)}.to raise_error "Airport is full."
  end

  describe "#land" do

    it "returns a message if a plane has landed" do
      good_weather
      expect(subject.land(plane)).to eq "You have landed plane: #{plane}"
    end

    it "raises an error if trying to land in a storm" do
      bad_weather
      expect{subject.land(plane)}.to raise_error "You cannot land in a storm."
    end

  end


  describe "#take_off" do

    it "returns a message when the plane has taken off" do
      good_weather
      subject.land(plane)
      expect(subject.take_off).to eq "The flight now leaving is: #{plane}"
    end

    it "raises an error if trying to take off in a storm" do
      bad_weather
      subject.land(plane)
      expect{subject.take_off}.to raise_error "You cannot take off in a storm."
    end

  end

end
