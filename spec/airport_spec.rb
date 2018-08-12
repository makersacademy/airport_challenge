require 'airport'

describe Airport do
  let(:mockAeroplane) { double :aeroplane }
  
  it "has either stormy or clear weather" do
    expect(subject.weather).to eq("clear").or eq "stormy"
  end
  
  it "has a default .capacity" do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end
  
  it "has a variable .capacity" do
    subject = Airport.new(500)
    expect(subject.capacity).to eq 500
  end

  describe "#land()" do
    it "stores planes in an airport" do
      expect(subject.land(mockAeroplane)).to include mockAeroplane
    end
  end

  describe "#take_off()" do
    it "clears a plane from the airport" do
      subject.land(mockAeroplane)
      expect(subject.take_off(mockAeroplane)).to eq mockAeroplane
    end

    it "will not release planes that aren't in the airport" do
      expect { subject.take_off("BA344") }.to raise_error "BA344 not in airport"
    end
  end
end
