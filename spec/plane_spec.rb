require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to(respond_to(:flying?)) }
  it { is_expected.to(respond_to(:take_off?)) }
  it { is_expected.to(respond_to(:land?)) }

  it "should have flying status when flying" do
    expect(subject).to be_flying
  end

  it "should have flying status when plane has taken off" do
    expect(subject).to be_flying
  end

  it "should not have flying status when landed" do
    expect(subject).not_to be_land
  end
end
