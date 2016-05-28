require 'airport'

describe Airport do

  let (:plane) {double :plane}

  it "docks planes" do
    expect(subject.dock(plane)).to eq plane
  end

end
