require 'airport.rb'

RSpec.describe Airport do 
subject(:airport) { described_class.new(20) }
let(:plane) { double :plane }
describe "#Land" do 
  context 'when not stormy' do 
      before do 
        allow(airport).to receive(:stormy?).and_return(false) 
      end 

    it 'should land a plane' do 
      expect { airport.land(plane) }.not_to raise_error
    end  

    context '#When full' do
      it 'does not allow planes to land when airport is full' do 
        20.times do 
          airport.land(:plane)
        end 
        expect { airport.land(:plane) }.to raise_error 'cannot land plane airport full'
      end
    end
  end 
end

  context '#Stormy' do 
    it 'does not allow plane to take off if weather is stormy' do 
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
    end 
  end 

  describe 'take off' do
    it 'does not raise an error' do  
      expect { airport.take_off(plane) }.not_to raise_error
    end 
  end
end 
