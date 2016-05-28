require 'plane'

describe Plane do

  it do
    expect(subject).to respond_to(:land)
  end

  it do
    expect(subject).to respond_to(:report_landed)
  end

  it "can initialize a new plane" do
    expect(subject).to be_a(Plane)
  end

end
