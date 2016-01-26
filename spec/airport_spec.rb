require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double(:plane, :landed => false, :landed= => true)}

  before do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
  end

  it "can't have a plane land twice" do
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error "This plane has already landed."
  end

  it "can't have a plane take-off if it isn't at the airport already" do
    expect { airport.take_off(plane) }.to raise_error "This plane is not at this airport."
  end

  it "can't have a plane take-off twice" do
    airport.land(plane)
    airport.take_off(plane)
    expect { airport.take_off(plane) }.to raise_error "This plane is not at this airport."
  end

  it "can't have a plane landing in more than one place" do
    airport.land(plane)
    allow(plane).to receive(:landed).and_return(true)
    airport_2 = Airport.new
    expect { airport_2.land(plane) }.to raise_error "This plane is already landed at another airport."
  end

  it "prevents landing when airport full" do
    Airport::DEFAULT_CAPACITY.times { airport.land(double(:plane, :landed => false, :landed= => false)) }
    expect { airport.land(double(:plane, :landed => false, :landed= => false))  }.to raise_error "This airport is full"
  end

  it "can have capacity set when airport created" do
    airport_2 = Airport.new(15)
    expect(airport_2.capacity).to eq 15
  end

  it "can have capacity overwritten when needed" do
    airport.capacity = 30
    expect(airport.capacity).to eq 30
  end

  it "can't have a plane take-off in stormy weather" do
    airport.land(plane)
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
    expect { airport.take_off(plane) }.to raise_error "Can't take off due to stormy weather"
  end

  it "can't have a plane land in stormy weather" do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error "Can't land due to stormy weather"
  end
end