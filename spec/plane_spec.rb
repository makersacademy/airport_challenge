require 'plane'
describe Plane do
  let(:airport) { double("airport",
                  :landing_clear? => true,
                  :takeoff_clear? => true,
                  :plane_arrived => nil,
                  :plane_left => nil)
                }

  it { is_expected.to respond_to :land_at }
  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :takeoff_from }

  it 'is expected to land at an airport and confirm that it has landed' do
    expect(subject.landed?(airport)).to be false
    subject.land_at(airport)
    expect(subject.landed?(airport)).to be true
  end

  it 'is expected to take off from an airport and confirm that it is no longer in the airport' do
    subject.land_at(airport)
    subject.takeoff_from(airport)
    expect(subject.landed?(airport)).to be false
  end

end
