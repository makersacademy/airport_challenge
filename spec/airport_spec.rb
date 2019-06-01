require 'spec_helper'
require 'airport'
require 'weather'
require 'plane'

describe Airport do
  it 'allows planes to land' do
    airport = Airport.new
    expect(airport).to respond_to(:permission_to_land)
  end

end
