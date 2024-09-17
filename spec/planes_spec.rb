require './lib/planes'

describe Plane do
  let(:plane) { Plane.new }
  it {is_expected.to respond_to :landed?}

  it {is_expected.to respond_to :landed}

  it "Checks to see if a new plane has landed" do
    expect(subject.landed).to eq true
  end
end
