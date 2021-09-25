require "airport"

describe Airport do
  it { is_expected.to respond_to(:full?) }

  it { is_expected.to respond_to(:plane_landed) }

  it { is_expected.not_to be_full }

  it "is full after a plane has landed" do
    subject.plane_landed
    expect(subject).to be_full
  end
end
