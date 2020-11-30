require 'weather'

describe Weather do
  it "checks wether it's sunny" do
    expect(subject.sunny?).to eq(true).or eq(false)
  end
end
