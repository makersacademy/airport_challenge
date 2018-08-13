require 'airport' # Require 'plane' in order to double instances of the Plane class? No

describe Airport do  
  subject { described_class.new(mockWeatherStation) }  # subject(:airport) { described_class.new }
  let(:mockWeatherStation) { double :weatherstation }  # These top two lines should be ordered other wayaround but RSpec is very forgiving.  i.e. we should say 'let mockWS double WS' then change the subject.  
  let(:mockPlane) { double :plane }                    # let(:plane) { instance_double("Plane") }
  let(:mockPlane2) { double :plane }                  
  let(:mockWeatherStation) { double :weatherstation }  # If we don't initialize Airports with Weather.new would this be valid: et(calmWeather) { double :weather, :conditions_safe? => true }
  subject { described_class.new(mockWeatherStation) }    
  
  describe '#initialize ', :initialize do 
    it 'with an empty @hangar' do 
      expect(subject.hangar).to be_empty           
    end
    it 'with a default capacity of 1' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY) # expect(subject.capacity).to eq 1
    end
    it 'allows for variable capcity' do                         # diff_capacity = 30  
      large_airport = Airport.new(mockWeatherStation, 50)       # large_airport = Airport.new(diff_capacity)
      expect(large_airport.capacity).to eq 50                   # exepect(large_airport.capacity).to eq diff_capacity
    end                                          
  end
  
  describe '#status ', :status do 
    before { subject.hangar << mockPlane }
    it 'provides plane location' do 
      expect(subject.status(mockPlane)).to eq "#{mockPlane} is in the hangar"
    end
  end 

  describe '#take_off', :take_off do 
    it { is_expected.to respond_to(:take_off).with(1).argument }  
    context 'when weather is calm' do  
      before { subject.hangar << mockPlane }
      it 'allows plane to launch and confirms plane departure' do 
        allow(mockWeatherStation).to receive(:conditions_safe?).and_return(true) 
        allow(mockPlane).to receive(:fly)
        expect(subject.take_off(mockPlane)).to eq "#{mockPlane} has left the airport"
      end
    end  
    context 'when weather is stormy' do # let(:stormyWeather) { double :weather, conditions_safe? => false }
      before { subject.hangar << mockPlane }
      it 'does not allow plane to launch' do 
        allow(mockWeatherStation).to receive(:conditions_safe?).and_return(false)
        expect { subject.take_off(mockPlane) }.to raise_error 'DANGER - Weather is stormy'
      end 
    end
  end
  
  describe '#land', :land do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'denies landing when hangar is full' do
      allow(mockWeatherStation).to receive(:conditions_safe?).and_return(true)
      allow(:mockPlane2).to receive(:touch_down)
      Airport::DEFAULT_CAPACITY.times { subject.land(mockPlane) } # This is a class constant
      expect { subject.land(mockPlane2) }.to raise_error 'WARNING - Hangar is at capacity'
    end  
    context 'when weather is calm' do 
      it 'adds planes to @hangar' do
        allow(mockWeatherStation).to receive(:conditions_safe?).and_return(true)
        allow(mockPlane).to receive(:touch_down)
        subject.land(mockPlane)
        expect(subject.hangar).to include(mockPlane)
      end
      it 'allows planes to land' do 
        allow(mockWeatherStation).to receive(:conditions_safe?).and_return(true)
        allow(:mockPlane).to receive(:touch_down)
        subject.land(mockPlane)
        # allow(subject).to receive(:status).and_return("#{mockPlane} is in the hangar")
        expect(subject.status(mockPlane)).to eq "#{mockPlane} is in the hangar"
      end
    end
  
    context 'when weather is stormy' do
      it 'does not allow planes to land' do 
        allow(mockWeatherStation).to receive(:conditions_safe?).and_return(false)
        expect { subject.land(mockPlane) }.to raise_error 'DANGER - Weather is stormy'
      end
    end
  end

end
