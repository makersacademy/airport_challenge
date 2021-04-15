describe Plane do
  it { is_expected.to respond_to(:land) }

  it 'has an attribute "grounded"' do
    expect(subject).to be_grounded
  end

  it 'takes off and changes grounded to false' do
    subject.takeoff
    expect(subject).not_to be_grounded
  end
end
