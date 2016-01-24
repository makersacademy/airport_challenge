require './lib/Airport.rb'
require './lib/Plane.rb'


describe Airport do
  let(:plane) {double :plane}

  it "confirmation of landing" do
    subject.landed(plane)
    expect(subject.grounded_planes).to eq [plane]
  end
  it "confirmation of departure" do
    subject.landed(plane)
    subject.flying(plane)
    expect(subject.grounded_planes).to eq []
  end
end
