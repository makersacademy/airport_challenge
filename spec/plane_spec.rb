require './lib/plane.rb'

describe Plane do

  let (:airport) { double :airport }

  it { is_expected.to respond_to(:land_at).with(1).arguments }

  it "lands at the airport" do
    expect(subject.land_at(airport)).to eq true
  end

end
