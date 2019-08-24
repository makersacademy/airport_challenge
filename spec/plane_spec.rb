require './lib/plane.rb'

describe Plane do

  let (:airport) { double :airport }

  it { is_expected.to respond_to(:land_at).with(1).arguments }
  it { is_expected.to respond_to(:take_off_from).with(1).arguments}
  it { is_expected.to respond_to(:taken_off?) }

  it "lands at the airport" do
    expect(subject.land_at(airport)).to eq true
  end

  it "confirms that it has taken off" do
    subject.take_off_from(airport)
    expect(subject.taken_off?).to eq true
  end


end
