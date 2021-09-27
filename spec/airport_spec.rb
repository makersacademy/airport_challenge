require 'airport'

# Use describe when the tests are related by a subset of behaviour (e.g 'landing') and 
# use context when the tests are related by program state (e.g. 'when it is stormy').

# Hangar state
context Airport do
  let (:plane) { double("plane") }
  
  before do 
    allow(plane).to receive(:grounded=).with(true)
  end

  it "Should keep track of the amount of plane instances in airport" do
    subject = Airport.new(plane)
    expect(subject.hangar).to be_a Array
  end 

  it "Should allow you to create an instance of an airport with several planes inside" do 
    subject = Airport.new(plane, plane, plane, plane)
    expect(subject.hangar.length).to eq(4)
  end
end 

# Capacity state
context Airport do
  let (:plane) { double("plane") }

  it "Should be able to have it's capacity manually set" do 
    subject = Airport.new
    subject.capacity = 45 
    expect(subject.capacity).to eq(45)
  end

  it "Should have a default capacity of 15" do 
    subject = Airport.new
    expect(subject.capacity).to eq(15)
  end

end 

# Weather state
context Airport do
  let (:plane) { double("plane") }
  
  before do 
    allow(plane).to receive(:grounded=).with(true)
  end

  it "Should have a weather instance variable set to an integer value" do 
    subject = Airport.new
    expect(subject.weather).to be_a Integer
  end

  it "Should have a randomly generated value assigned to the weather instance variable" do 
    subject1 = Airport.new
    subject2 = Airport.new
    subject3 = Airport.new
    subject4 = Airport.new 
    expect(subject1.weather == subject2.weather && subject2.weather == subject3.weather && subject4.weather == subject1.weather).to be_falsey
  end

  it "Should refuse to let planes land on the rare occasion the weather is stormy (9 or 10)" do
    subject = Airport.new 
    subject.weather = 9
    expect { subject.receive(plane) }.to raise_error("The weather is too stormy to land")
  end

  it "Should refuse to let planes take off on the rare occasion the weather is stormy (9 or 10)" do 
    subject = Airport.new(plane)
    subject.weather = 10
    expect { subject.lose(plane) }.to raise_error("The weather is too stormy to take off")
  end 
end

# Takeoff
describe Airport do
  let (:plane) { double("plane") }
  let (:plane2) { double("plane2") }

  before do 
    allow(plane).to receive(:grounded=).with(true)
    allow(plane2).to receive(:grounded=).with(true)
    allow(plane).to receive(:take_off)
    allow(plane2).to receive(:take_off)
    allow(plane).to receive(:land)
    allow(plane2).to receive(:land)
  end

  it "Should release an instance of the plane object from it's collection upon takeoff" do
    subject = Airport.new(plane)
    subject.weather = 2
    subject.lose(plane)
    expect(subject.hangar.length).to eq(0)
  end

  it "Should only allow planes to take off from airports they are in" do 
    subject1 = Airport.new
    subject1.weather = 2
    subject2 = Airport.new
    subject2.weather = 2 
    subject1.receive(plane)
    subject2.receive(plane2)
    expect { subject2.lose(plane) }.to raise_error("#{plane} is not at this airport")
  end

  it "Should ensure the correct plane has taken off" do
    subject = Airport.new(plane, plane2)
    subject.weather = 2
    subject.lose(plane2)
    expect(subject.hangar.include?(plane2)).to eq(false)
    expect(subject.hangar.include?(plane)).to eq(true)
  end
end

# Landing 
describe Airport do
  let (:plane) { double("plane") }
  
  before do 
    allow(plane).to receive(:grounded=).with(true)
    allow(plane).to receive(:grounded).and_return(true)
    allow(plane).to receive(:land)
  end

  it "Should raise an error and prevent landing when the airport is full" do
    allow(plane).to receive(:grounded=).with(true)

    subject = Airport.new(plane)
    subject.capacity = 1
    expect { subject.receive(plane) }.to raise_error("The airport is full")
  end 

  it "Should automatically set a plane's grounded instance variable to true upon receiving the plane at the airport" do
    allow(plane).to receive(:grounded).and_return(true)
    allow(plane).to receive(:land)
    subject = Airport.new
    subject.weather = 2
    subject.receive(plane)
    expect(plane.grounded).to eq(true)
  end 

  it "Can land planes" do 
    subject = Airport.new
    subject.weather = 2
    subject.receive(plane)
    expect(subject.hangar).to include plane
  end
end 
