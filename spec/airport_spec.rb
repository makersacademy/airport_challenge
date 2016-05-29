require 'airport'

describe Airport do

  let(:plane) { double :plane, :landed? => false }
   
   context 'Responds to' do
    it '#land' do
      expect(subject).to respond_to :land
    end

    it '#take_off' do
      expect(subject).to respond_to :take_off
    end
  end

  context '@Capacity' do
    it 'Allow ability to change Airport capacity for Planes' do
      subject.change_cap(5)
      expect(subject.cap).to eq (5)
    end
  end

  context '#land' do
    it 'lands a plane at the airport' do
      subject.land(plane)
      expect(subject.planes.include?(plane)).to eq(true)
    end

    it 'does not land a plane if weather is stormy' do
      allow(subject).to receive(:stormy?) { :true }
      expect{subject.land(plane)}.to raise_error('Error. Unable to land plane due to stormy weather')
    end

    it 'does not land a plane if the airport is full' do
      allow(subject).to receive(:full?) { :true }
      expect{subject.land(plane)}.to raise_error('Error. Unable to land plane due to full capacity')
    end

    it 'does not land a plane if it is already landed' do
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error('Error. Unable to land a plane that is already landed')
    end
  end

  context '#take_off' do
    it 'take-off a plane' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq([])
    end

    it 'does not take-off a plane if weather is stormy' do
      allow(plane).to receive(:is_landed)
      subject.land(plane)
      allow(subject).to receive(:stormy?) { :true }
      expect{subject.take_off(plane)}.to raise_error('Error. Unable to take-off plane due to stormy weather')
    end
  end
end
