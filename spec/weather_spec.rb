require 'weather'

describe Weather do

  it "provides an answer to .stormy?" do
    expect(subject.stormy?).to eq(true).or eq(false)
  end

end
