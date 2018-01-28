require 'weather'

describe Weather do
  it "returns true or false" do
    expect(Weather::stormy?).to eq(true).or eq(false)
  end
end
