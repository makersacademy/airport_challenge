require 'airport'
require 'plane'

describe Airport do
  before(:each) do
    @airport = Airport.new
    @plane_on_ground = Plane.new
    @plane_in_flight = Plane.new true
  end

  it { is_expected.to have_attributes(:capacity => a_value > 0 )}
  it { is_expected.to have_attributes(:weather => Symbol) }
  it { is_expected.to have_attributes(:planes => []) }
  it { is_expected.to respond_to(:clear_for_landing, :clear_for_takeoff).with(1).argument }

  it 'allows planes to land' do
    @airport.clear_for_landing(@plane_in_flight)
    expect(@airport.planes.last).to eq @plane_in_flight
  end

  it 'allows planes to take off' do
    plane = @plane_in_flight
    @airport.clear_for_landing(plane)
    @airport.clear_for_takeoff(plane)
    expect(@airport.planes).not_to include plane
  end

  it 'only allows planes to land if they are in flight' do
    expect { subject.clear_for_landing(@plane_on_ground) }.to raise_error 'Plane is not in flight'
  end

  # it 'prevents planes from landing when at full capacity' do
  #   expect
  # end
end