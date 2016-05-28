require 'airport'

describe Airport do

  let (:plane) {double :plane}


  it "docks and releases planes" do
    plane1 = plane
    subject.dock(plane1)
    expect(subject.release).to eq plane1
  end

end
