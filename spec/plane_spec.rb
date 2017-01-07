require "plane"

describe Plane do

  it { is_expected.to respond_to :land_request }

  it "instructed to land at airport"
    expect(subject.land_request).to eq true

end
