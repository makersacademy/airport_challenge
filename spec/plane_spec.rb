require 'airport'
require 'plane'

describe Plane do
  it "starts by flying" do
    expect(subject).to be_flying
  end

  it { is_expected.to respond_to(:flying?) }

  it { is_expected.to respond_to(:landed?) }
  it "changes state when landed" do
    plane = subject.landed?
    expect(plane).to eq false
  end

end
