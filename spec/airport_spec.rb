require 'airport'

describe Airport do
 subject(:airport) { described_class.new }
   let(:plane) { double :plane }
   let(:weather) { double :weather }
   let(:good_weather) { allow(subject).to receive(:stormy).and_return(false) }
   let(:bad_weather) { allow(subject).to receive(:stormy).and_return(true) }
   let(:airport_full) { allow(subject).to receive(:full?).and_return(true) }
   let(:airport_not_full) { allow(subject).to receive(:fully?).and_return(false) }
   let(:added_plane) { allow(subject).to receive(:add_plane).and_return(true) } 
   let(:landable_plane) { allow(plane).to receive(:land).and_return(true) }
   let(:take_offable_plane) { allow(plane).to receive(:take_off).and_return(true) }
    
     
     
     describe '#land' do  
    
      it 'will not allow landing when stormy and will fail with message' do
        bad_weather
        expect { subject.land(plane) }.to raise_error "Weather is stormy so no landing"
      end
    
      it 'will not allow landing when airport is full' do
        airport_full
        expect { subject.land(plane) }.to raise_error "Airport is full. Please find another airport to land"
      end

      it "will store the plane in planes" do
        good_weather
        airport_not_full
        landable_plane
        expect(subject).to receive(:add_plane).and_return(true)
        subject.land(plane)
      end

      it "will call on plane.land" do
        good_weather
        airport_not_full
        landable_plane
        expect(subject).to receive(:add_plane)
        subject.land(plane)
      end
    end
 
  describe '#take_off' do

    
    it 'will not run  when stormy and fail' do
      bad_weather
      expect { subject.take_off(plane) }.to raise_error "I cannae do it, she cannae handle the weather"
      
    end 

    it 'will call remove_plane after ' do  
      good_weather 
      landable_plane
      take_offable_plane
      allow(subject).to receive(:remove_plane)
      subject.land(plane)
      expect(subject).to receive(:remove_plane)
      subject.take_off(plane)
    end
    
    it 'will call plane.take_off' do
      good_weather 
      take_offable_plane
      allow(subject.planes).to receive(:include?).and_return(true) 
      allow(subject).to receive(:remove_plane)
      expect(plane).to receive(:take_off)
      subject.take_off(plane) 
    end
   
  end
  
  describe '#remove_plane' do

    it { is_expected.to respond_to(:remove_plane).with(1).argument }
    
  end
  describe '#stormy' do
    
    it 'will call on weather.stormy' do
      allow(subject.weather).to receive(:stormy)
      expect(subject.weather).to receive(:stormy)
      subject.stormy
    end
  end  
  
  describe '#full' do

    it 'will return true when plans is at or greater than  capacity' do
      allow(subject.planes).to receive(:size) { 20 }
      allow(subject).to receive(:capacity) { 20 }
      expect(subject.full?).to eq true
    end
    
    it 'will return false when plans is less than capacity' do
      allow(subject.planes).to receive(:size) { 3 }
      allow(subject).to receive(:capacity) { 20 }
      expect(subject.full?).to eq false
    end
  end
end

