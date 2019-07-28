require 'airport'
describe Airport do
  subject(:airport) { described_class.new}
  it { expect(airport).to respond_to(:land).with(1).argument }
  it { expect(airport).to respond_to(:take_off).with(1).argument }
  #it { expect(Airport.new).to respond_to(:take_off) }
end