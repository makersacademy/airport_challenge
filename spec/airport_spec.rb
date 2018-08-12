require './lib/airport'

describe Airport do
  
  it "verifies Airport exists" do
    expect(subject).to be_a(Object)
  end

  it "lands a plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it "makes a plane take off" do
    plane = Plane.new
    expect(plane).not_to eql(subject.take_off)
  end

  it "prevents plane from taking off if stormy" do
    subject.report_stormy
    expect { subject.take_off }.to raise_error "Weather is stormy - no taking off, please"
  end

  it "prevents plane from landing if stormy" do
    subject.report_stormy
    expect { subject.land }.to raise_error "Weather is stormy - no landing, please"
  end




# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
end







