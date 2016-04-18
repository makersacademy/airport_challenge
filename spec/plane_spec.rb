require 'plane'

describe Plane do
  subject(:plane){described_class.new}

  it "reports when not landed" do
    expect(plane.flying).to eq false
  end

  it "reports when landed" do
    subject.landed?
    expect(plane.landed).to eq true
  end

end
