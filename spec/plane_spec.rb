describe Plane do
  it 'can take off and is flying' do
    subject.take_off
    expect(subject.flying?). to eq true
  end
  it 'can land and is no longer flying' do
    subject.take_off
    subject.land
    expect(subject.flying?). to eq false
  end
  it 'cannot land if it has not taken off' do
    expect {subject.land}.to raise_error 'The plane cannot land as it has not taken off yet'
  end
  it 'cannot take off if it is already flying' do
    subject.take_off
    expect {subject.take_off}.to raise_error 'The plane cannot take off as it is already in the air'
  end
end
