require 'airport.rb'
require 'plane.rb'

describe Airport do 
  let(:airport) { described_class.new } # Creates a new instance of the airport class which can be used throughout the entire block
  let(:plane) { Plane.new }

  it "creates attributes capacity and hangar" do
    expect(subject).to have_attributes(hangar: [], capacity: 10)
  end

  it "pushes planes into the hangar array" do 
    expect { subject.land(plane) }.to change { subject.hangar.size }.by(1)
  end

  

  it { expect(subject).to respond_to(:land).with(1).argument } 
  
  it "instructs a plane to take off from the airport" do
    expect(subject).to respond_to(:take_off)
  end


end

