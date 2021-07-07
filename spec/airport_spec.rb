require 'airport'

describe Airport do

  describe 'sunny' do

    before do
      allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    end

    context 'landing' do

      it '#land successful' do
        plane = Plane.new
        expect(subject.land(plane)).to eq :landed
      end

      it 'DEFAULT_CAPACITY can change and correct number of planes #land' do
        subject.capacity = 100
        99.times { subject.land(Plane.new) }
        expect(subject.land(Plane.new)).to eq :landed
      end

      it 'prevents #land if airport is full at DEFAULT_CAPACITY' do
        Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error 'Airport full'
      end

      it 'prevents #land if airport is full at new capacity' do
        subject.capacity = 100
        100.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error 'Airport full'
      end

    end

    context 'take off' do
  
      it '#take_off confirmed' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.take_off(plane)).to eq :flying
      end

      it 'plane is removed on #take_off' do
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect { subject.take_off(plane) }.to raise_error 'Plane not in airport'
      end

      it 'removes the correct plane' do
        plane = Plane.new
        subject.land(plane)
        plane1 = Plane.new
        subject.land(plane1)
        subject.take_off(plane)
        expect(subject.planes).to include plane1
      end

      it 'plane can only leave airport it is in' do
        expect { subject.take_off(Plane.new) }.to raise_error 'Plane not in airport'
      end

    end
  end

  describe 'stormy' do
  
    context 'landing' do

      it 'prevents #land' do
        allow_any_instance_of(Weather).to receive_messages(stormy?: true)
        expect { subject.land(Plane.new) }.to raise_error 'Weather stormy'
      end

    end

    context 'take off' do

      it 'prevents #take_off' do
        allow_any_instance_of(Weather).to receive_messages(stormy?: false)
        plane = Plane.new
        subject.land(plane)
        allow_any_instance_of(Weather).to receive_messages(stormy?: true)
        expect { subject.take_off(plane) }.to raise_error 'Weather stormy'
      end

    end
  end
end
