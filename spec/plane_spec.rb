require 'plane'

describe Plane do

  let(:airport) { double :airport, receive: true, launch: true, planes: [] }

  it 'has a flying status when created' do
    expect(subject.status?).to eq 'flying'
  end

  it 'has a flying status when in the air' do
    expect(subject.status?).to eq 'flying'
  end

  it 'can take off' do
    airport.receive subject
    airport.launch subject
    planes = airport.planes
    expect(planes.include? subject).to be false
  end

  it 'changes its status to flying after taking off' do
    airport.receive subject
    airport.launch subject
    expect(subject.status?).to eq 'flying'
  end

end
