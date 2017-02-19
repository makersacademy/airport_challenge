require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  it "lands the plane in the airport" do
    expect(subject.land(plane)).to eq plane
  end

  it "confirms the plane has landed" do
    plane = subject.land(plane)
    expect(subject.confirm_landing).to eq "The #{plane} has landed at #{subject}."
  end

  it "gets the plane to take off from the airport" do
    plane = subject.land(plane)
    gateways = subject.take_off(plane)
    expect(subject.take_off(plane)).not_to include(plane)
  end

  it {is_expected.to respond_to :empty_gateway}

  it "shows plane has left the airport" do
    message = "The gateway is empty as #{plane} has taken off."
    expect(subject.empty_gateway(plane)).to eq message
  end

end
