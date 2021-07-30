require 'airport'
require 'plane'

describe Airport do
  before(:each) { @airport = Airport.new }

  it { is_expected.to have_attributes(:capacity => a_value > 0 )}
  it { is_expected.to have_attributes(:weather => Symbol) }
  it { is_expected.to have_attributes(:planes => []) }
  it { is_expected.to respond_to(:clear_for_landing, :clear_for_takeoff).with(1).argument }
end