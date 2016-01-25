require './lib/Airport.rb'
require './lib/Plane.rb'
#require './lib/Weather.rb'


describe Airport do
  let(:plane) {double :plane}
  let(:weather) {double :weather}
  subject(:airport) { described_class.new }


  it "confirmation of landing" do
    allow(airport).to receive(:sunny?).and_return(true)
    subject.landed(plane)
    expect(subject.grounded_planes).to eq [plane]
  end
  it "confirmation of departure" do
    allow(airport).to receive(:sunny?).and_return(true)
    subject.landed(plane)
    subject.flying(plane)
    expect(subject.grounded_planes).to eq []
  end
  it "expects error if airport is full" do
    allow(airport).to receive(:sunny?).and_return(true)
    20.times { subject.landed(plane) }
    expect { subject.landed(plane) }.to raise_error("Airport Full")
  end
=begin
  it "expects user to be able to change amount of planes airport can hold" do
    airport1 = Airport.new(30)
    allow(airport).to receive(:sunny?).and_return(true)
    30.times{ subject.landed(plane)}
    30.times{ subject.flying(plane)}
    expect(airport1.grounded_planes).to eq []
  end
=end
   it "dont allow planes to leave if weather is stormy" do
    allow(airport).to receive(:sunny?).and_return(false)
    expect{subject.flying(plane)}.to raise_error("Too stormy to take off")
  end
  it "dont allow planes to land if weather is stormy" do
    allow(airport).to receive(:sunny?).and_return(false)
    expect{subject.landed(plane)}.to raise_error("Too stormy to land")
  end

end
