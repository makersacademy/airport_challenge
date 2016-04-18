require 'plane'

describe Plane do
  it{is_expected.to respond_to(:landed?)}
  it{is_expected.to respond_to(:flying)}

  it "reports when not landed" do
    expect(subject.flying).to eq false
  end

  it "reports when landed" do
    expect(subject.landed?).to eq true
  end

end
