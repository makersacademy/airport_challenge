require 'plane'

describe Plane do

  it { is_expected.to respond_to :flying? }
  it { is_expected.to respond_to :landed }
  it { is_expected.to respond_to :flying }

  it "when plane lands to change location to airport" do
    subject.landed
    expect(subject).to have_attributes(location: :airport)
  end
  it "when plane takes off to change location to sky" do
    subject.flying
    expect(subject).to have_attributes(location: :sky)
  end

end
