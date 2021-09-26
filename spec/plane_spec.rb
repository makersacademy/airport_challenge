require 'plane'

describe Plane do

  it "confirms that plane is flying" do
    expect(subject.flying?).to eq true
  end

  it "confirms that plane is landed" do
    expect(subject.landed?).to eq true
  end

end
