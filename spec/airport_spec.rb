require 'airport'

describe Airport do

let(:plane) {double :plane}
GOOD_WEATHER = 3
# Airport.expects(:stormy?).with(4).returns(2)

  it {is_expected.to respond_to :land, :take_off}

  it "should land a plane, storing it in the hangar" do
    subject.land(plane, GOOD_WEATHER)
    expect(subject.hangar).to eq [plane]
  end

  it "should allow a plane to take-off, removing it from the hangar" do
    subject.land(plane, GOOD_WEATHER)
    subject.take_off(GOOD_WEATHER)
    expect(subject.hangar).to be_empty
  end

  it "should only return true for stormy? if the number passed is 2" do
    expect(subject.stormy?(2)).to eq true
  end

  it "should fail to take-off if weather is stormy" do
    subject.land(plane, GOOD_WEATHER)
    expect{subject.take_off(2)}.to raise_error("Weather is too stormy.")
  end

  it "should fail to land if weather is stormy" do
    expect{subject.land(plane, 2)}.to raise_error("Weather is too stormy.")
  end

  it "should fail to land if hanger has reached capacity" do
    subject.capacity = 1
    subject.hangar << plane
    expect{subject.land(plane, GOOD_WEATHER)}.to raise_error("Hangar is at capacity")
  end

  it "should set a default capacity when a new airport is initialized" do
    gatwick = Airport.new
    expect(gatwick.capacity).to eq gatwick.default_capacity
  end

  it "should have a capacity that is mutable" do
    gatwick = Airport.new
    gatwick.capacity = 2
    expect(gatwick.capacity).to eq 2
  end

end
