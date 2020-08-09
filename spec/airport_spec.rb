require 'airport'

describe Airport do

  it "airport exists" do
    airport = Airport.new
    expect(airport).to be_an_instance_of(Airport)
  end

  it { is_expected.to respond_to(:land).with(1).argument }

end
