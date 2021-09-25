# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

require 'airport' 

describe Airport do
  subject(:airport) { described_class.new }

  describe '#airport attributes' do

    it 'can store planes on its tarmac' do
      expect(subject.tarmac).to be_a_kind_of(Array)
    end

    it 'can change capacity' do
      airport = Airport.new('NYC', 10)
      expect(airport.capacity).to eq 10
    end

  end

  describe '# weather conditions are ok' do
      context 'when sunny' do
        before do
          allow(airport).to receive(:stormy?).and_return(false)
        end

      it 'can instruct planes to land' do
        plane = Plane.new('EZY123')
        subject.land(plane)
        expect(plane.ground).to eq true
        expect(plane.location).to eq subject.name
        expect(subject.tarmac).to include(plane.name)
      end

      it 'prevents landing if capacity is full' do
        plane = Plane.new('EZY812')
        subject.land(plane)
        plane2 = Plane.new('BA1993')
        expect { subject.land(plane2) }.to raise_error('Tarmac is full.')
      end

      it 'can instruct planes to take off' do
        plane = Plane.new('RYA123')
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.tarmac).to_not include(plane.name)
        expect(plane.ground).to eq false
        expect(plane.location). to eq 'Sky'
      end

      it 'can confirm that the plane has taken off' do
        plane = Plane.new('RYA123')
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.confirm(plane)).to eq 'Flying high!'
      end
      
    end
  end


  describe "# bad conditions " do 
    context 'when stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return(true)
      end

      it 'prevents landing if stormy' do
        plane = Plane.new('RYA891')
        expect { subject.land(plane) }.to raise_error('Treacherous conditions. Stay put.')
      end

      it 'prevents take off if stormy' do
        plane = Plane.new('EZY999')
        plane.ground = false
        plane.location = subject.name
        subject.tarmac << plane
        expect { subject.take_off(plane) }.to raise_error('Stormy. Cannot take off.')
      end

    end
  end
  
end