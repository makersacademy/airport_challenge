describe Plane do
  it 'should indicate it is flying if flying' do
    subject.fly
    expect(subject.isflying?).to equal true
  end

  it 'should raise error when instructed to fly when already flying' do
    subject.fly
    expect { subject.fly }.to raise_error "This plane is already in flight"
  end
end
