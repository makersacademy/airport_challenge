require 'plane'
require 'airport'

describe Plane do
  before(:each) do
    @airport = Airport.new
    allow(@airport).to receive(:weather) { "sunny" }
  end

  it 'knows it is flying after take_off' do
    @airport.take_off(subject)
    expect(subject).to be_flying
  end
end
