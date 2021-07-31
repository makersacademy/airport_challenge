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

  it "has a hangar array to store planes" do
    expect(subject.hangar).to be_a Array
  end

  it "stores a plane in hangar after landing" do 
    subject.land(plane)
    expect(subject.hangar.size).to eq 1
  end

  it "can confirm a plane is at the airport" do
    subject.land(plane)
    expect(subject.contains?(plane)).to be true
  end

  it "can confirm a plane, after taking off, is no longer at the airport" do
    subject.hangar << plane
    allow(plane).to receive(:on_ground) { true } 
    subject.take_off(plane)
    expect(subject.contains?(plane)).to be false
  end

  it "can accept default capacity number of planes" do
    expect { subject.capacity.times { subject.land(plane) } }.not_to raise_error
  end

  it "prevents landing when the airport is full" do
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Landing not permitted: airport full!"
  end

  it "can tell user the airport capacity and confirm default capacity" do
    expect(subject.capacity).to eq 10
  end

  it "allows user to set custom capacity when instantiating new airport object" do
    expect(Airport.new(100).capacity).to eq 100
  end

  it "accepts only positive integers as capacity" do
    [0, -3, "1", 4.5, true, Array.new].each do |bad_capacity|
      expect { Airport.new(bad_capacity) }.to raise_error "Airport capacity must be a positive integer"
    end
  end

  it "prevents take off if weather is stormy" do
    subject.hangar << plane
    allow(plane).to receive(:on_ground) { true }
    allow(subject.weather).to receive(:stormy?) { true }
    expect { subject.take_off(plane) }.to raise_error "Take off not permitted when weather is stormy"
  end

  it "prevents landing if weather is stormy" do
    allow(subject.weather).to receive(:stormy?) { true }
    expect { subject.land(plane) }.to raise_error "Landing not permitted when weather is stormy"
  end

  it "can't land a plane if it is already on the ground" do
    allow(plane).to receive(:on_ground) { true }  
    expect { subject.land(plane) }.to raise_error "That plane is already on the ground!"
  end

  it "can't allow plane to take off it is already in the air" do
    expect { subject.take_off(plane) }.to raise_error "That plane is already in the air!" 
  end

  it "can't allow plane to take off from a different airport" do
    subject.hangar << plane
    allow(plane).to receive(:on_ground) { true } 
    expect { Airport.new.take_off(plane) }.to raise_error "That plane is at a different airport!"
  end

end
