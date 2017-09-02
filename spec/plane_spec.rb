require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it "should have flying status when flying" do
    expect(subject).to be_flying
  end

  it "should have flying status when plane has taken off" do
    expect(subject).to be_flying
  end

  it "should not have flying status when landed" do
    expect(subject).not_to be_landed
  end
end
