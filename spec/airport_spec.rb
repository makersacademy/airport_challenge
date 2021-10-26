require 'airport'

describe Airport do
  
  let(:plane) { double :plane }

  before(:each) do
    allow(subject.weather).to receive(:stormy?) { false }
    allow(plane).to receive(:on_ground) { false }
    allow(plane).to receive(:report_location) { true }
  end
  
  it { is_expected.to be_a Airport }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "can confirm a landed plane is at the airport" do
    subject.land(plane)
    expect(subject.contains?(plane)).to be true
  end

  it "can provide list of landed planes via hangar method" do
    2.times { subject.land(plane) }
    expect(subject.hangar).to eq "#[Double :plane], #[Double :plane]"
  end

  it "can confirm a plane, after taking off, is no longer at the airport" do
    subject.land(plane)
    allow(plane).to receive(:on_ground) { true } 
    subject.take_off(plane)
    expect(subject.contains?(plane)).to be false
  end

  it "can accept default capacity number of planes" do
    expect { subject.capacity.times { subject.land(plane) } }.not_to raise_error
  end

  it "prevents landing and raises error when the airport is full" do
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Landing not permitted: airport full!"
  end

  it "can tell user the airport capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "allows user to set custom capacity when instantiating new airport object" do
    expect(Airport.new(100).capacity).to eq 100
  end

  it "can land planes up to a custom capacity without error" do
    airport = Airport.new(100)
    allow(airport.weather).to receive(:stormy?) { false }
    expect { airport.capacity.times { airport.land(plane) } }.not_to raise_error
  end

  it "raises an error if custom capacity exceeded" do
    airport = Airport.new(50)
    allow(airport.weather).to receive(:stormy?) { false }
    airport.capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Landing not permitted: airport full!"
  end

  it "capacity must be a positive integer, or an error is raised" do
    [0, -3, "1", 4.5, true, Array.new].each do |bad_capacity|
      expect { Airport.new(bad_capacity) }.to raise_error "Airport capacity must be a positive integer"
    end
  end

  it "raises error and prevents take off if weather is stormy" do
    subject.land(plane)
    allow(plane).to receive(:on_ground) { true }
    allow(subject.weather).to receive(:stormy?) { true }
    expect { subject.take_off(plane) }.to raise_error "Take off not permitted when weather is stormy"
  end

  it "raises error and prevents landing if weather is stormy" do
    allow(subject.weather).to receive(:stormy?) { true }
    expect { subject.land(plane) }.to raise_error "Landing not permitted when weather is stormy"
  end

  it "raises error if user attempts to land a plane that is on the ground" do
    allow(plane).to receive(:on_ground) { true }  
    expect { subject.land(plane) }.to raise_error "That plane is already on the ground!"
  end

  it "raises error if user attempts to take off a plane that is already in the air" do
    expect { subject.take_off(plane) }.to raise_error "That plane is already in the air!" 
  end

  it "raises error if user attempts to take off plane from a different airport" do
    subject.land(plane)
    allow(plane).to receive(:on_ground) { true } 
    expect { Airport.new.take_off(plane) }.to raise_error "That plane is at a different airport!"
  end

end
