require 'airport.rb'
describe Airport do
  let(:plane) {described_class.new}
  it 'allows plane to land' do
    expect(Airport.new).to respond_to(:land).with(1).argument
  end
  it 'allows plane to take off' do
  expect(Airport.new).to respond_to(:take_off).with(1).argument
  end
  it 'checks airport capacity' do
    
  end
end