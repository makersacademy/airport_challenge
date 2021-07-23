require 'airport.rb'

describe Airport do 
  subject(:airport) { described_class.new(5) }
  let(:plane) {double :plane}

  describe 'Airport' do
    it 'default airport capacity that can be overridden' do
    end

  describe '#land' do 
    before do 
      allow(airport).to receive(:weather?).and_return false
    end

    it 'instruct a plane to land at an airport' do
      expect(airport).to respond_to(:landing).with(1).argument
    end 

    it 'prevents landing when full' do
      5.times do
        airport.landing(plane)
      end
      expect { airport.landing(plane) }.to raise_error 'No space to land'
    end  
  end
  
  describe '#take_off' do
    before do
      allow(airport).to receive(:weather?).and_return false 
    end

    it 'instruct a plane to take off from an airport' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end 

    it 'confirm that plane is no longer in the airport after take off' do
      expect { subject.take_off(planes) }.not_to include subject
    end
  end

  describe '#weather?' do
    it 'prevents take off when stormy' do
      allow(airport).to receive(:weather?).and_return true
      expect {airport.take_off(plane) }.to raise_error 'Unsafe to land, bad weather'
    end
    
    it 'prevents landing when stormy' do
      allow(airport).to receive(:weather?).and_return true
      expect {airport.landing(plane) }.to raise_error 'Unsafe to land, bad weather'
    end
    end
  end
end
