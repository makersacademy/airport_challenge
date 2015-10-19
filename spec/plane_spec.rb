require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let(:a) {double(:airport, stormy?: false, planes: [])}

  before (:each) do
    allow(a).to receive(:take_off).and_return(plane)
    allow(a).to receive(:land).with(plane)
  end

  it 'should not take off or be in an airport if flying' do
    plane.fly
    a.land(plane)
    allow(plane).to receive(:flying).and_return(true)
    a.take_off(plane)
    expect(plane.flying).to eq true
  end

  it 'cannot land at an airport if it is not flying' do
    plane.landed
    a.land(plane)
    expect(plane.flying).to eq false
  end


  it 'is no longer in the airport after taking off' do
    a.land(plane)
    a.take_off(plane)
    expect(plane).not_to eq (a.planes[0])
  end
end
