require 'airport'

describe Airport do

  let(:plane) { double :plane, :is_landed => true, :not_landed => true, :landed? => false}
  let(:plane_landed) { double :plane_landed, :landed? => true, :not_landed => true}

  before(:each) do
    allow(subject).to receive(:stormy?) { nil }
  end
   
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
      plane.
      subject.take_off(plane)
      expect(subject.planes).to eq([])
    end

    it 'does not take-off a plane if weather is stormy' do
      subject.land(plane)
      allow(subject).to receive(:stormy?) { :true }
      expect{subject.take_off(plane_landed)}.to raise_error('Error. Unable to take-off plane due to stormy weather')
    end

    it 'only allows for planes to take-off from airports they are in' do
      airport2 = Airport.new
      airport2.land(plane)
      expect{subject.take_off(plane_landed)}.to raise_error('Error. Unable to take-off a plane from another airport')
    end
  end
end
