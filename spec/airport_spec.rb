require 'airport'
require 'aircraft'

describe Airport do
  it 'Lands a plane - into array. Unit test' do
    b747 = Aircraft.new("in flight")
    expect(subject.airport_landing(b747)).to be true
  end
end
