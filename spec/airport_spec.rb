require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }
     

  context 'when not stormy'  do
    before(:each) { allow(subject).to receive(:stormy).and_return(false) }
    before(:each) { allow(plane).to receive(:land).and_return(true) }

    it 'will allow planes' do
      expect(airport.land(plane)).to eq [plane]
    end

    it 'will allow planes that have landed to take_off' do
      airport.land(plane)
      allow(plane).to receive(:take_off).and_return(true) 
      expect(airport.take_off(plane)).to eq plane     
    end
  
    it 'will not allow landing when airport is full and will raise error' do
      20.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport is full. Please find another airport to land"
    end
 
    it 'will not allow a plane that is not in the airport to take off' do
      expect { airport.take_off(plane) }.to raise_error "That plane is not in this airport"
    end
  end


  context 'when stormy' do
    before(:each) { allow(subject).to receive(:stormy).and_return(true) }
      
    it 'will not allow landing and will raise error' do
        expect { subject.land(plane) }.to raise_error "Weather is stormy so no landing"
    end
    
    it 'will not allow take off and will raise error' do
      expect { subject.take_off(plane) }.to raise_error "I cannae do it, she cannae handle the weather"  
    end 
  end
end
