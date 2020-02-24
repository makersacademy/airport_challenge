require "airplane"

describe Airplane do
  # TEST: Respond to Method landing
  it { is_expected.to respond_to :landed? }

  # TEST: Respond to Variable landing
  it { is_expected.to respond_to :landed }

  # TEST: Plane status
  it "Check to see if a new plane is on the group" do
    expect(subject.landed).to eq true
  end
end
