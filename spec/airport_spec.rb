require 'airport'
require 'plane'
require 'weather'

describe Airport do

  before(:all) do
    @weather = Weather.new
    @airport = Airport.new(@weather)
    @plane = Plane.new

  end

  it 'responds to .take_off' do
    expect(@airport).to respond_to(:take_off)
  end

  it 'if it is stormy, do not let the plane take off' do
    allow(@weather).to receive(:stormy?).and_return(true)
    expect{Airport.new(@weather).take_off}.to raise_error "too stormy to take off!"
  end


end
