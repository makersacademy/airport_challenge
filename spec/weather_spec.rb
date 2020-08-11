require 'weather'

describe Weather do
  it "Expects weather to respond to stormy? method" do
    expect(subject).to respond_to(:stormy?)
  end
end
