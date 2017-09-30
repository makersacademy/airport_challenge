require 'weather'

describe Weather do
  it "checks for stormy weather" do
    expect(subject).to respond_to(:stormy?)
  end
end
