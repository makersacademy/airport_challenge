require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do
  context 'taking off and landing' do
    context 'In Good Weather' do
      it 'a plane can land' do
        plane = double :plane, has_landed: true
        allow(subject).to receive(:weather).and_return('Sunny')
        expect(subject.land plane).to eq [plane]
      end

      it 'a plane can take off' do
        plane = double :plane, has_landed: true, taken_off: false
        allow(subject).to receive(:weather).and_return('Sunny')
        subject.land plane
        subject.take_off plane
        expect(subject.plane_check).to eq []
      end
    end

    context 'traffic control'
      it 'a plane cannot land if the airport is full' do
        plane = double :plane, has_landed: true
        allow(subject).to receive(:weather).and_return('Sunny')
        10.times { subject.land plane }
        expect { subject.land plane }.to raise_error 'Airport is Full'
      end

    context 'In Bad Weather'
      it 'a plane cannot take off when there is a storm brewing' do
        plane = double :plane, has_landed: true
        allow(subject).to receive(:weather).and_return('Sunny')
        subject.land plane
        allow(subject).to receive(:weather).and_return('Stormy')
        expect { subject.take_off plane }.to raise_error 'Storm\'s a Brewin'
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(subject).to receive(:weather).and_return('Stormy')
        flying_plane = double :plane, landed: false
        expect { subject.land flying_plane }.to raise_error 'Storm\'s a Brewin'
      end
  end
end
