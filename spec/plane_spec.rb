require 'plane'

describe Plane do

  it 'has a Plane class' do
    expect(subject).to be_a(Plane)
  end

  it 'can respond to \'land\' method with an argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

end
