require './lib/airport'

RSpec.describe Airport do
  
  let(:plane) { double :plane }
  
  describe '#land' do
    it 'Allow plan to land' do
      expect(subject).to respond_to(:land_plane)
    end

    it 'Raise error if airport is at fully capacity' do
      ammount = subject.capacity
      ammount.times do
        subject.land_plane(plane)
      end
      expect { subject.land_plane(plane) }.to raise_error 'Landing: no airport space'
    end
    
    it 'Raise error if airport is at fully capacity' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land_plane(plane) }.to raise_error 'Landing: to stormy to land'
    end
   
  end

  describe '#take off' do
  
    it 'instructs a plane to take off' do
      allow(subject).to receive(:stormy?).and_return false
      expect(subject).to respond_to(:take_off)
    end

    it 'raises an error if asked to take off a plane' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.take_off(plane) }.to raise_error 'Taking: to stormy to take off'
    end

  end

  describe '#weather' do
  
    it 'no bad weather reports' do
      expect(subject.stormy).to eq(false)
    end

    it 'raises an error if asked to take off a plane' do
      expect(subject.report_storm).to eq(true)
    end

  end

end
