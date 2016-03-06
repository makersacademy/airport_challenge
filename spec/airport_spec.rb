require 'airport'

describe Airport do
 subject(:airport) { described_class.new }
   let(:plane) { double :plane }
   let(:weather) { double :weather }

  describe '#good_weather' do
    describe '#land' do 
  
    it { is_expected.to respond_to(:land).with(1).argument }
  end
    it 'will not allow landing when stormy and will fail with message "nope"' do
      allow(subject).to receive(:stormy).and_return(true)
      expect { subject.land(plane)}.to raise_error "nope"
    end 
    
    it 'will not allow landing when airport is full' do
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.land(plane) }.to raise_error "ALL FULL TRY THE THAMES"
  end

    it "will store the plane in planes" do
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.planes.include? plane).to eq true
    end

    it "will call on plane.land" do
      allow(plane).to receive(:land)
      expect(plane).to receive(:land)
      subject.land(plane)
    end
  end

  describe '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }
    
    it 'will not allow take_off when stormyand fail with message "I cannae do it, she cannae handle the weather captain" ' do
      allow(subject).to receive(:stormy).and_return(true)
      allow(plane).to receive(:take_off)
      expect { subject.take_off(plane) }.to raise_error "I cannae do it, she cannae handle the weather"
      # expect(plane).to not_receive(:take_off)
      
    end 

    it 'will call remove_plane after take_off' do  
      
      allow(subject).to receive(:stormy). and_return(false)
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(subject).to receive(:remove_plane)
      subject.land(plane)
      expect(subject).to receive(:remove_plane)
      subject.take_off(plane)
    end
    
    it 'will call plane.take_off' do
      
      allow(subject).to receive(:stormy).and_return(false)
      allow(plane).to receive(:take_off).and_return(true)
      allow(subject).to receive(:remove_plane)
      expect(plane).to receive(:take_off)
      subject.take_off(plane) 
    end
   
  end
  
  describe '#remove_plane' do
 #   let(:planes) { double :planes }

    it { is_expected.to respond_to(:remove_plane).with(1).argument }
    
#    it 'will delete the plane it was given'  do
#      allow(subject).to receive(:planes).and_return([plane])
#      subject.planes
#      expect  subject.remove_plane(plane).to_return plane 
#    end
  end
  describe '#stormy' do
    it { is_expected.to respond_to(:stormy) }
    
    it 'will call on weather.stormy' do
    allow(subject.weather).to receive(:stormy)
    expect(subject.weather).to receive(:stormy)
    subject.stormy
    end
  end  

end
