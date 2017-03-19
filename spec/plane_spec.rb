require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  it "checks plane has landed" do
    expect(subject.landed).to eq true
  end

end
