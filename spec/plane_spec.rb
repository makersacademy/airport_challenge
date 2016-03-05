require 'plane'
describe Plane do
  subject(:plane) { described_class.new }

  it 'creates a landed plane' do
    expect(subject.landed).to be true
  end

  it 'lands at an airport and confirms that it has landed' do
    subject.land
    expect(subject.landed).to be true
  end

  it 'take off and confirm that it is no longer in the airport' do
    subject.take_off
    expect(subject.landed).to be false
  end
end
