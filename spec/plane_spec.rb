require 'plane'

describe Plane do

  let(:airport) {double(:airport)}

  it { is_expected.to respond_to(:log).with(1).argument}
  it { is_expected.to respond_to(:unlog)}

  it "already at the airport" do
    expect {subject.log airport }.to raise_error("Plane already at airport")
  end

  it "already flying" do
    expect {subject.unlog}.to raise_error("Plane already flying")
  end

end
