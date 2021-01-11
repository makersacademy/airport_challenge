require 'airport'

describe Airport do

  subject(:airport) { described_class.new(20) }

  it 'should allow a plane to land' do
expect(airport).to respond_to(:land).with(1).argument
end

  it 'does not allow to land when at full capacity' do
  plane = double :plane
    20.times do
    airport.land(plane)
end
  expect {airport.land(plane)}.to raise_error 'airport full'
end


  describe '#takeoff' do
    context 'when weather is stormy' do
        it 'does not allow planes to land' do
          airport = Airport.new(20)
          plane = Plane.new
          allow(airport).to receive(:stormy?).and_return true
          expect { airport.takeoff(plane) }.to raise_error 'weather too stormy to takeoff'
        end
    end
end

it 'plane should takeoff' do
    expect(airport).to respond_to(:takenoff?).with(1).argument
end




    
    # context'when not stormy' do
    #     before do 
    #         allow(airport).to receive(:stormy?).and_return false
    #     end
    # end
    # context 'when stormy' do
    #     it 'raises an error' do
    #       allow(airport).to receive(:stormy?).and_return true
    #       expect { airport.land(planes) }.to raise_error 'Cannot land plane: weather is stormy'
    #     end
    # end




# it 'confirms takeoff to airport' do
#     plane = subject.takenoff?
#     expect(plane).to be_takeoffconfirmed
# end


end
