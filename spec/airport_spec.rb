require 'airport'

describe Airport do

  let(:plane) { double :plane, flying?: true}


  describe 'take off' do
    it 'instructs a plane to take off' do
      is_expected.to respond_to(:plane_take_off)
    end

    it 'releases a plane' do
      subject.plane_land(plane)
      subject.plane_take_off(plane)
    end
  end


  describe 'landing' do
    it 'instructs a plane to land' do
      is_expected.to respond_to(:plane_land)
    end

    it 'receives a plane' do
      subject.plane_land(plane)
    end

     it 'can\'t land same plane twice' do
       subject.plane_land(plane)
       expect { subject.plane_land(plane)}.to raise_error
       'Plane has already landed'
     end
  end


  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        subject.capacity.times { subject.plane_land(Plane.new)}
        expect { subject.plane_land(Plane.new)}.to raise_error
        'Cannot currently land at airport'
      end
    end

    context 'when airport is empty' do
      it 'no planes can take off' do
        subject.empty? { subject.plane_take_off(plane)}
        expect { subject.plane_take_off(plane)}.to raise_error
        'Cannot currently take off'
      end
    end

    context 'when weather conditions are stormy' do
      it 'creates stormy conditions' do
        expect(subject).to respond_to(:weather)
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather).and_return(:stormy)
        expect { subject.plane_land(plane) }.to raise_error
        'Cannot currently land at airport'
      end

      it 'does not allow a plane to take off' do
        allow(subject).to receive(:weather).and_return(:sunny)
        subject.plane_land(plane)
        allow(subject).to receive(:weather).and_return(:stormy)
        expect{subject.plane_take_off(plane)}.to raise_error
        'Cannot currently take off'
      end
    end
  end
end
