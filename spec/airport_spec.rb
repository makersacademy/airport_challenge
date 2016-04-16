require 'airport'
require 'plane'
describe Airport do
  let(:plane) {double(:plane)}

  it 'should land plane' do
    expect(subject.land(plane)).to eq true
  end

  it 'should confirm plane has landed' do
    expect(subject.landed?(plane)).to eq true
  end


end