require 'plane'

describe Plane do

  it { is_expected.to respond_to (:landed?) }

  it 'shows plane as not being landed by default' do
    expect(subject.landed?).to be(false)
  end

  it 'confirms landing status has changed after being allowed to land' do
    airport = Airport.new
    airport.allow_to_land(subject)
    expect(subject.landed?).to be(true)
  end

end
