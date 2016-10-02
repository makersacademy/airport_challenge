require 'plane'
require 'airport'

describe Plane do

  let(:airport) { Airport.new }

  it {is_expected.to respond_to :flying?}


  it 'updates flying when landing' do
    allow(airport).to receive(:weather) { "fine" }
    airport.land(subject)
    expect(subject.flying).to eq(false)
  end

  # it 'updates flying after takeoff' do
  #   airport = Airport.new
  #   airport.takeoff(subject)
  #   expect(subject.flying).to eq(true)
  # end


end
