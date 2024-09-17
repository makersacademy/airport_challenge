require 'airport'

checker = Airport.new

describe Airport do 

  let(:plane) { double :plane }
  let(:plane2) { double :plane }

  it "is initialized with an array" do
    checker = Airport.new
    expect(checker.hangar).to be_kind_of(Array)
  end

  it "is initialized with an array of capacity 10" do
    checker = Airport.new
    expect(checker.capacity).to eq 10
  end

  it "can be initialized with any capacity" do
    checker = Airport.new(5)
    expect(checker.capacity).to eq 5
  end

  it "doens't land more planes than its capacity" do
    checker = Airport.new(1)
    allow(checker).to receive(:landing_permitted?).and_return(true)
    allow(plane).to receive(:landed).and_return(false)
    allow(plane2).to receive(:landed).and_return(false)
    allow(plane).to receive(:plane_has_landed)
    allow(plane2).to receive(:plane_has_landed)
    checker.land(plane)
    checker.land(plane2)
    expect(checker.hangar.length).to eq 1
  end

  it "lets a plane land" do
    checker = Airport.new
    allow(checker).to receive(:landing_permitted?).and_return(true)
    allow(plane).to receive(:landed).and_return(false)
    allow(plane).to receive(:plane_has_landed)
    checker.land(plane)
    expect(checker.hangar.empty?).to eq false
  end

  it "prevents landing when stormy" do
    checker = Airport.new
    allow(plane).to receive(:plane_has_landed)
    allow(checker).to receive(:landing_permitted?).and_return(false)
    expect(checker.land(plane)).to eq nil
  end

  it "lets a plane take off" do
    checker = Airport.new
    allow(checker).to receive(:landing_permitted?).and_return(true)
    allow(plane).to receive(:landed).and_return(false)
    allow(plane).to receive(:plane_is_flying)
    allow(plane).to receive(:plane_has_landed)
    checker.land(plane)
    checker.take_off(plane)
    expect(checker.hangar.include?(plane)).to eq false
  end

  it "prevents take off when stormy" do
    checker = Airport.new
    allow(checker).to receive(:landing_permitted?).and_return(true)
    allow(plane).to receive(:landed).and_return(false)
    allow(plane).to receive(:plane_has_landed)
    allow(plane).to receive(:plane_is_flying)
    checker.land(plane)
    allow(checker).to receive(:landing_permitted?).and_return(false)
    checker.take_off(plane)
    expect(checker.take_off(plane)).to eq nil
  end

  it "lets you check if a specific plane is in the hangar" do
    checker = Airport.new
    allow(checker).to receive(:landing_permitted?).and_return(true)
    allow(plane).to receive(:landed).and_return(false)
    allow(plane2).to receive(:landed).and_return(false)
    allow(plane).to receive(:plane_has_landed)
    allow(plane2).to receive(:plane_has_landed)
    checker.land(plane)
    checker.land(plane2)
    expect(checker.plane_in_hangar?(plane2)).to eq true
  end

  it "reports to a plane that it has landed, to prevent double landing" do
    checker = Airport.new
    allow(checker).to receive(:landing_permitted?).and_return(true)
    allow(plane).to receive(:landed).and_return(false)
    allow(plane).to receive(:plane_has_landed)
    checker.land(plane)
    allow(plane).to receive(:landed).and_return(true)
    expect(checker.land(plane)).to eq nil
  end

  it "picks a weather type at random" do
    checker = Airport.new
    expect(checker.weather).to eq("fine").or eq("stormy")
  end

  it "permits landing if weather is fine" do
    checker = Airport.new
    allow(checker).to receive(:weather).and_return("fine")
    expect(checker.landing_permitted?).to eq true
  end

end
