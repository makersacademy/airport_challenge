require "airport"

describe Airport do

    let(:plane) {double :plane}

  it "returns the current list of planes" do
    expect(Airport.new.planes).to eq []
  end

  it 'sets a new capacity when provided a new value' do
    expect(subject.set_capacity(30)).to eq 30
  end

  describe "landing" do
    it "lands a plane" do
      expect(subject.land(plane).last).to eq plane
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
      expect(subject.take_off(plane)).to eq plane
    end
  end
end