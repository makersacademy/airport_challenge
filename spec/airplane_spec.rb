require "airplane"

describe Airplane do
  it "allows for an airplane to be made" do
    expect(Airplane.new).to be_a(Airplane)
  end
end
