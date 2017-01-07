require "airport"

describe Airport do
  # Create a double of airplane
  let(:airplane) {double :airplane, :landed= => false, landed?: false}
  let(:weather) {double :weather, :sunny= => true, sunny?: true}

  # TEST: Respond to method land_plane
  it { is_expected.to respond_to :land_plane }

  # TEST: Check method land_plane responds to 1 argument
  it { is_expected.to respond_to(:land_plane).with(1).argument }

  # TEST: Respond to Array airplanes
  it { is_expected.to respond_to :airplanes }

  # TEST: Check that there are no planes at a new airport
  it "Check to see if there are no planes initially at the airport" do
    expect(subject.airplanes).to eq []
  end

  # TEST: Allow a plane to land at an airport
  it "Land a plane at the airport and confirm" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    expect(subject.land_plane(airplane)).to include(airplane)
  end

  # TEST: Respond to method takeoff_plane
  it { is_expected.to respond_to :takeoff_plane }

  # TEST: Check method takeoff_plane responds to 1 argument
  it { is_expected.to respond_to(:takeoff_plane).with(1).argument }

  # TEST: Land an airplane then take off
  it "Land an airplane then take off" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    expect(subject.takeoff_plane(airplane)).to eq airplane
  end

  # TEST: Check that an airplane that has taken off is in the air
  it "Check an airplane that is in the sky is not landed" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    subject.takeoff_plane(airplane)
    expect(airplane).to_not be_landed
  end

  # TEST: Land airplane, take off then check that it isn't at the airport
  it "Make sure an airplane that as taken off is not at the airport" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    subject.takeoff_plane(airplane)
    expect(subject.airplanes).to_not include(airplane)
  end

  # TEST: Land an airplane and prevent it to take off if weather not sunny
  it "Prevent airplane to take off if not sunny" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    subject.sunny = false
    error = "Weather Stormy cannot take off"
    expect{subject.takeoff_plane(airplane)}.to raise_error error
  end

  # TEST: Prevent landing if weather is Stormy
  it "Prevent airplane to land if not sunny" do
    subject.sunny = false
    error =  "Weather Stormy cannot land"
    expect{subject.land_plane(airplane)}.to raise_error error
  end

  # TEST: Land DEFAULT_CAPACITY amount of planes then try and land another
  it "Raise an error if the airport is full" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(airplane) }
    expect{subject.land_plane(airplane)}.to raise_error "Airport full!"
  end

  # TEST: Fill the airport up, remove one airplane then land another
  it "Check to see if you can fill, remove then fill airport" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(airplane) }
    allow(airplane).to receive(:landed).and_return(true)
    subject.takeoff_plane(airplane)
    expect(subject.airplanes).to include(airplane)
  end

  # TEST: Overwrite default airport capacity
  it "Overwrite default airport capacity to 30" do
    expect(subject.capacity=30).to eq 30
  end

  # TEST: Overwrite default airport capacity to 50 when initialising class
  it "Overwrite default airport capacity to 50 when initialising class" do
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end

  # TEST: raise error if you try and takeoff a plane that is not at the airport
  it "Raise error if plane already in sky and try takeoff" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    error = "Airplane is already in the sky!"
    expect{subject.takeoff_plane(airplane)}.to raise_error error
  end

  # TEST: Raise error if plane already tries to land when already at airport
  it "Raise error if plane already tries to land when already at airport" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    error = "Airplane is already here"
    expect{subject.land_plane(airplane)}.to raise_error error
  end

  # TEST: raise error if you try and takeoff an airplane that is not at airport
  let(:airplane2) {double :airplane, :landed= => true, landed?: true}
  it "Raise error if plane not at airport and try to takeoff" do
    subject.sunny = true
    allow(airplane2).to receive(:landed).and_return(true)
    error = "Airplane is not at this airport"
    expect{subject.takeoff_plane(airplane2)}.to raise_error error
  end
end
