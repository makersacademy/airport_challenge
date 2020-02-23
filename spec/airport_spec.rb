require 'airport.rb'
require 'plane.rb'

describe Airport do 
  DEFAULT_CAPACITY = 10
  let(:airport) { Airport.new(DEFAULT_CAPACITY) } # Creates a new instance of the airport class which can be used throughout the entire block
  let(:plane) { Plane.new }

  it { expect(subject).to respond_to(:land) }  
  it { expect(subject).to respond_to(:take_off) }

  it "creates attributes capacity and hangar" do
    expect(subject).to have_attributes(capacity: DEFAULT_CAPACITY, hangar: [])
  end

  it "adds planes into the hangar" do 
    expect { subject.land(plane) }.to change { subject.hangar.count }.by(1)
  end

  it "raises error when hangar array is greater than or equal to default capacity" do 
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Plane cannot land: airport full"
  end
  
  it "removes planes from the hangar" do 
    expect { subject.take_off(plane) }.to change { subject.hangar.count }.by(-1)
  end
end 


