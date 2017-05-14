require 'plane'

describe Plane do
  let(:airport) { double(:airport) }

  describe '#flying'
  it 'shows true when a plane is created' do
    expect(subject.flying).to eq true
  end
  it 'shows true when a plane is in the air' do
    subject.departs
    expect(subject.flying).to eq true
  end
  it 'shows false if the plane has landed' do
    subject.arrives
    expect(subject.flying).to eq false
  end

end
