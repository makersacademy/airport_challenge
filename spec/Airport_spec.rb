require './lib/Airport.rb'
require './lib/Plane.rb'
#require './lib/Weather.rb'


describe Airport do
  let(:plane) {double :plane}
  let(:weather) {double :weather}
  subject(:airport) { described_class.new }


  it "confirmation of landing" do
    subject.landed(plane)
    expect(subject.grounded_planes).to eq [plane]
  end
  it "confirmation of departure" do
    subject.landed(plane)
    subject.flying(plane)
    expect(subject.grounded_planes).to eq []
  end
  it "expects error if airport is full" do
    20.times { subject.landed(plane) }
    expect { subject.landed(plane) }.to raise_error("Airport Full")
  end
=begin
  it "expects user to be able to change amount of planes airport can hold" do
    airport = Airport.new(10)
    10.times {subject.landed(plane)}
    expect {subject.landed(plane)}.to raise_error("Airport Full")
  end

  it "dont allow planes to leave if weather is stormy" do
    subject.landed(plane)
    expect(subject.grounded_planes).to eq []
  end
=end
end
