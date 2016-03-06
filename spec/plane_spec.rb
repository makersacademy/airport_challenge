require 'plane'
describe Plane do
  subject(:plane) { described_class.new }

  it 'confirms that it has landed' do
    subject.land
    expect(subject.landed).to be true
  end

  it 'confirms that it is no longer in the airport' do
    subject.take_off
    expect(subject.landed).to be false
  end
end
