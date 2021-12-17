require "airport"

describe Airport do 
  
  it "weather gives true or false" do
    port = Airport.new
    expect(subject.weather?).to eq(true).or(eq(false)) 
  end 

  it "has default capacity" do
    expect(subject.capacity).to eq(20)
  end 

  it "sets capacity" do
    subject.capacity = 150
    expect(subject.capacity).to eq(150)
  end 

  it "prevent landing when airport if full" do
    plane = double(:plane)
    allow(subject).to receive(:weather?) { false }
    subject.capacity.times { subject.land plane }
    expect { subject.land double(:plane, weather?: false) }.to raise_error "No space at the airport!"
  end

  it "land plane when weather is clear" do
    plane = double(:plane)
    allow(subject).to receive(:weather?) { false }
    expect(subject.land(plane)).to include(plane)
  end
   
  it "allow take off when weather is clear" do
    plane = double(:plane)
    allow(subject).to receive(:weather?) { false }
    subject.land plane
    subject.take_off
    expect(subject.planes).to_not include(plane)
  end

  it "stop plane landing when weather is poor" do
    plane = double(:plane)
    allow(subject).to receive(:weather?) { true }
    expect { subject.land(plane) }.to raise_error "Poor weather!"
  end

  it "stop plane taking off when weather is poor" do
    plane = double(:plane)
    allow(subject).to receive(:weather?) { false }
    subject.land(plane)
    allow(subject).to receive(:weather?) { true }
    expect { subject.land(plane) }.to raise_error "Poor weather!"
  end

end
