# unit test for Plane
require 'Plane'
describe Plane do
  subject(:plane) { described_class.new } # 'subject is the class described.new - instance of a class'
    # 'is expected to respond to method :confirm '
  it 'plane confirms take off' do
    expect(plane).to respond_to(:confirm)
  end
end
