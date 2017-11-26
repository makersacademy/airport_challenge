require 'weather'

describe Weather do
  it "returns true or false for stormy?" do
    expect(subject.stormy?).to be(true).or be(false)
  end
end
