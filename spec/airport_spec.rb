require "airport"

describe Airport do

  let(:plane) {double :plane}

  it "returns planes in the airport" do
    expect(Airport.new.planes).to eq []
  end

  it "sets a new capacity" do
    expect(subject.set_capacity(30)).to eq 30
  end

  describe "landing" do
    it "lands a plane" do
      expect(subject.land(plane)).to eq "#{plane} has landed."
    end

    it "stores the landed plane in the airport" do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

     it "raises an error if over capacity" do
      subject.set_capacity.times{subject.land(plane)}
      expect{subject.land(plane)}.to raise_error("This airport is full!")
    end
  end

  describe "take-off" do
    before(:example) do
      subject.land(plane)
    end

    it "plane takes off" do
      expect(subject.take_off(plane)).to eq "#{plane} has taken off."
    end

    it "removes the plane from the airport" do
      subject.take_off(plane)
      expect(subject.planes).to_not include plane
    end
  end
end