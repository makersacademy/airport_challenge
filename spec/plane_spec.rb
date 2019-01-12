require 'plane'

RSpec.describe Plane do

  it 'should respond to landed with true or false' do
    expect([true, false]).to include plane_test.landed
  end

  it 'should return true for landed plane' do
    subject.takes_off
    subject.lands
    expect(subject.landed).to be_truthy
  end

  it 'should return false for landed plane' do
    subject.takes_off
    expect(subject.landed).to be_falsey
  end

end
