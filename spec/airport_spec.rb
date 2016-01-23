require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) {double(:plane)}

  it "can land a plane" do
    expect(airport).to respond_to(:land).with(1).argument
  end

end