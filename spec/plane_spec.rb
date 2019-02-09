describe Plane do
  it 'should indicate it is flying if flying' do
    subject.fly
    expect(subject.isflying?).to equal true
  end

end
