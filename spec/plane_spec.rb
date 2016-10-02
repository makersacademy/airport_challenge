require 'plane'

describe Plane do
    let(:airport) { double(:airport)}
  it 'lands somewhere' do
    subject.land(airport)
    expect(subject.state).to eq 'grounded'
  end
  it 'takes off' do
    subject.take_off
    expect(subject.state).to eq 'flying'
  end
  it 'confirms state after take off' do
    subject.take_off
    expect(subject.confirm).to eq 'flying'
  end
  it 'confirms state after landing' do
    subject.land(airport)
    expect(subject.confirm).to eq 'grounded'
  end
end
