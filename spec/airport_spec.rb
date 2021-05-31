require './lib/airport.rb'
describe Airport do
    subject(:airport) { described_class.new(20) }
    let(:plane) { double :plane }
  describe '#land' do  
    it 'instructs plane to land' do
      expect(airport).to respond_to(:land).with(1).argument 
    end
    
    context 'when at capacity' do
      it 'raises an error' do
        20.times do 
          airport.land(:plane)
        end
        expect { airport.land(:plane) }.to raise_error "Cannot land plane, Airport full."
      end 
    end 
  end   

   it 'instructs plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument 
   end



end