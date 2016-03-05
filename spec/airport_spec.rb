require "airport"

describe Airport do
  let(:plane){double :plane, :flying => false}

  it "has an empty array to store plane objects" do
    expect(subject.planes).to eq []
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq 20
  end

  it "can be initialized with a different capacity" do
    airport = Airport.new(10)
    expect(airport.capacity).to eq 10
  end

  describe "full" do
    it "should return true if airport is full" do
      20.times {subject.planes << plane}
      expect(subject).to be_full
    end
  end
  
end
