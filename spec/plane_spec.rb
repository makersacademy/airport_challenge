describe Plane do
  it { is_expected.to respond_to(:land) }

  it 'has an attribute "grounded", starts as false' do
    expect(subject).not_to be_grounded
  end

  it 'takes off and changes grounded to false' do
    subject.takeoff
    expect(subject).not_to be_grounded
  end

  it 'lands and changes grounded to true' do
    subject.land
    expect(subject).to be_grounded
  end
end
