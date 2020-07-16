require './lib/plane'

describe 'Plane' do
    subject {Plane.new}
  it 'check  already landed' do
    expect{subject.land}.to raise_error 'plane already landed'
  end
  it 'check state to land' do
    subject.state = :flying
    expect(subject.land).to be(:landed)
  end
  it 'check already flying' do
    subject.state = :flying
    expect{subject.take_off}.to raise_error 'plane already flying'
  end
  it 'check state to takeoff' do
    subject.state = :landed
    expect(subject.take_off).to be(:flying)
  end
end
