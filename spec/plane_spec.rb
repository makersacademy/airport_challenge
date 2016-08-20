require 'plane'

describe Plane do

  it { is_expected.to respond_to (:landed?) }

  it 'shows plane as not being landed by default' do
    expect(subject.landed?).to be(false)
  end

=begin
  it 'confirms it has landed after landing' do
    airport = Airport.new
    airport.land(subject)
    expect(subject.landed?).to be(true)
  end
=end

end
