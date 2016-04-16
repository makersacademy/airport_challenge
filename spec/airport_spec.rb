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

  it 'should instruct plane to take off' do
    expect(subject.take_off(plane)).to eq true
  end

  it 'should check if plane has departed' do
    expect(subject.departed?(plane)).to eq true
  end




end