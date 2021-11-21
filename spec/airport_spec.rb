require 'airport'

describe Airport do
  it "can be initialized with a default capacity" do 
    airport = Airport.new
    expect(airport).to be_an_instance_of(Airport)
    # NoMethodError:
    #    undefined method `each' for 42:Integer
    # had to swap and have the @hangar the last value in initialize -> why
    allow(airport).to receive_messages([])
    expect(airport.capacity).to eq 42
  end

  it "can be initialized with a custom capacity" do
    expect(Airport.new(11).capacity).to eq 11
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "raises an error when a plane tries to land but it is already at full capacity" do
    plane = double(:plane, landed: true, taken_off: false)
    # populate that array @hangar
    Airport::CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'Airport is full'
  end

  it "raises an error when a plane which isn't in the hangar tries to take off" do
    plane = double(:plane, landed: true, taken_off: false)
    expect { subject.take_off(plane) }.to raise_error 'this plane is not in this Airport'
  end

  it { is_expected.to respond_to(:safe?) }

  it "raises an error when the weather is not good to let planes take off" do
    plane = double(:plane, landed: true, taken_off: false)
    airport = double(:airport, land: true, take_off: false, full?: false, in_hangar?: true, safe?: false)
    allow(airport).to receive(:safe?).and_return false
    expect { airport.take_off(plane) }.to raise_error 'Weather is too stormy to take off'
  end
end
