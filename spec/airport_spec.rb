require 'airport'

describe Airport do

let(:plane) {double :plane}

  it {is_expected.to respond_to :land, :take_off}

#expect land to recieve the plane into the hanger
  it "should land a plane, storing it in the hangar" do
    subject.land(plane)
    expect(subject.hangar).to eq [plane]
  end
#expect take-off to remove a plane from the hangar
  it "should allow a plane to take-off, removing it from the hangar" do
    subject.land(plane)
    subject.take_off
    expect(subject.hangar).to be_empty
  end
#expect an error message when land is attempted and weather is stormy

#expect an error message when take-off is attempted and weather is stormy

#expect land to fail if hanger.length = airport capacity

#expect the airport capacity to have changed if the user changes it

end
