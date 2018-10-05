require 'weather'

describe Weather do

  it "returns the weather at that time" do
    expect(subject.check).to eq "sunny"
  end






end
