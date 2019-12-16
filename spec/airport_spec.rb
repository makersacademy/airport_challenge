require 'airport'
describe Airport do 
    subject(:airport) { described_class.new(20) }
    let(:plane) {double :plane}
it 'tells a plane to land' do 
    expect(airport).to respond_to(:land).with(1).arguments
end 
it 'tells a plane to take off' do
expect(airport).to respond_to(:take_off).with(1).arguments

end 
 
it 'does not allow planes to land when at capacity' do 
20.times do 
    airport.land(:plane)
end 
expect { airport.land(:plane) }.to raise_error 'Capacity full cannot land another plane '
end
end 
