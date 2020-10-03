require 'airport'

describe Airport do 
  airport = Airport.new
  it { expect(airport).to be_a Airport }
end
