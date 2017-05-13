require 'plane'

describe Plane do

  it { is_expected.to respond_to :landing_status }
  it { is_expected.to respond_to :land }

  it "shows a plane as airborn before being landed" do
    expect(subject.landing_status).to eq "airborn"
  end

  it "lands a plane" do
    subject.land
    expect(subject.landing_status).to eq "landed"
  end

  it "takes off" do
    subect.take_off
    expect(subject.landing_status).to eq "airborn"
  end

end
