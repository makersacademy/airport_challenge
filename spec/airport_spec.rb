require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument unless @stormy
end

  it 'instructs a plane to take off unless stormy' do
    expect(airport).to respond_to(:take_off).with(1).argument unless @stormy


end
  it 'prevents landing when airport is full' do
    expect(airport).to respond_to(:land_full) if @capacity
end
end
