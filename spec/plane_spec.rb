require 'plane'

describe Plane do

  subject(:plane) { described_class.new}
  let(:airport) { double :airport}
  let(:weather) { double :weather}


  it 'should land to airport' do
  airport = Airport.new
  airport.land(subject)
  allow(airport).to receive(:weather_check).and_return(nil)
  expect(subject.landed).to eq(true)
end
end
