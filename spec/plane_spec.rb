require 'plane'

describe Plane do
  it 'should respond to method land' do
    expect(subject).to respond_to :land
  end

  it 'should respond to method take_off' do
    expect(subject).to respond_to :take_off
  end
end
