# Unit test for Airport
require 'Airport'
describe Airport do
  subject(:airport) { described_class.new}  # 'subject is the class described.new - instance of a class'
    # 'is expected to respond to method :land with one argument'
  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

end