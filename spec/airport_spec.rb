require "airport"

RSpec.describe Airport do

  it {is_expected.to respond_to(:parked)}

  it "removes a plane from airport when take_off" do
    subject.land("easyjet")
    subject.take_off("easyjet")
    expect(subject.parked.length).to eq 0
  end

  it "confirms that plane.take_off is no longer in the airport" do
    subject.land("sleazyjet")
    expect(subject.take_off("sleazyjet")).to eq "sleazyjet no longer at airport"
  end

  it "confirms airport full if airport.parked >= @capacity" do
    subject.land("emirates")
    expect(subject.full?).to eq true
  end

  it "will prevent landing when the airport is full" do
    ryanair = Plane.new("Ryan Air")
    subject.land ryanair
    expect{subject.land("lufthansa")}.to raise_error(RuntimeError)
  end
end