require 'airport'
describe Airport do
  it { expect(Airport.new).to respond_to(:land) }
  it { expect(Airport.new).to respond_to(:take_off) }
end