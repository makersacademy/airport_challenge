require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).arguments }
  it 'checks if plane has landed' do
    airport = AirPort.new
    expect(subject.land(airport)).to eq 'The plane has landed'
  end

end
