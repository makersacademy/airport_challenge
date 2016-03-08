require 'airport'

describe Airport do
 subject(:airport) { described_class.new }
   let(:plane) { double :plane }
   let(:weather) { double :weather }
   let(:good_weather) { allow(subject).to receive(:stormy).and_return(false) }
   let(:bad_weather) { allow(subject).to receive(:stormy).and_return(true) }
   let(:airport_full) { allow(subject).to receive(:full?).and_return(true) }
   let(:airport_not_full) { allow(subject).to receive(:full?).and_return(false) }
   let(:added_plane) { allow(subject).to receive(:add_plane).and_return(true) } 
   let(:landable_plane) { allow(plane).to receive(:land).and_return(true) }
   let(:take_offable_plane) { allow(plane).to receive(:take_off).and_return(true) }
   let(:removable_plane) { allow(plane).to receive(:remove_plane) }
   let(:receive_size) { allow(subject.planes).to receive(:size) }
   let(:receive_capacity_20) { allow(subject).to receive(:capacity) { 20 } }
     
     

 context 'when not stormy'  do
  
   before(:each) { good_weather }
  
      it 'will allow planes that have taken off to land' do
        take_offable_plane
        landable_plane
        airport.land(plane)
        airport.take_off(plane)
        landable_plane
        expect(airport.land(plane)).to eq [plane]
      end
      it 'will allow planes that have landed to take_off' do
        landable_plane
        airport.land(plane)
        take_offable_plane
        expect(airport.take_off(plane)).to eq plane
           
      end

 describe '#land' do  
    
      it 'will not allow landing when stormy and will fail with message' do
        bad_weather
        expect { subject.land(plane) }.to raise_error "Weather is stormy so no landing"
      end
    
      it 'will not allow landing when airport is full' do
        landable_plane
        20.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error "Airport is full. Please find another airport to land"
      end


 
  describe '#take_off' do

    
    it 'will not run  when stormy and fail' do
      bad_weather
      expect { subject.take_off(plane) }.to raise_error "I cannae do it, she cannae handle the weather"
      
    end 

    
   
  end
 end
 end 
    

    
end


