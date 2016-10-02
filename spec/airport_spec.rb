require 'airport'

describe Airport do
  describe 'allows plane to land'
  it {is_expected.to respond_to :land?}

  describe 'allow plan to take_off'
  it {is_expected.to respond_to :take_off?}

  describe 'prevant plane from take_off if stormy'
  airport = Airport.new
  it {expect {airport.take_off?}.to raise_error("Cannot fly due to weather")if :stormy? }

end
