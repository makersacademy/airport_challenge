require 'weather'

describe Weather do
  it "checks for stormy weather" do
    expect(subject.stormy?).to eq(true)
  end
end
