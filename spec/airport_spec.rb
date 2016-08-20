require 'airport'

describe Airport do
  let (:plane) {double :plane}

  it "allows planes to land to an airport and confirms that it has landed" do
    expect(subject.land(plane)).to eq true
  end


end
