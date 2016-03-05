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

  describe "remove_plane" do
    it "should remove selected plane from array" do
      subject.planes << plane
      subject.remove_plane(plane)
      expect(subject.planes).to be_empty
    end
  end

   describe "add_plane" do
     it "should add selected plane to array" do
       subject.add_plane(plane)
       expect(subject.planes).to eq [plane]
     end
   end

end
