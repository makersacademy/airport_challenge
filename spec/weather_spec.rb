require 'weather'

describe Weather do
  it "responds to #stormy?" do
    is_expected.to respond_to(:stormy?)
  end
  it "returns true or false" do
    expect(subject.stormy?).to be(true).or be(false)
  end
end
