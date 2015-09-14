require 'airport'

describe Airport do

  let(:plane) { double :plane, land: nil, take_off: nil, status: nil }

  context 'When weather is sunny' do

    before(:each) do
     allow(subject).to receive(:stormy?) { false }
    end

    it 'Airport has a capacity' do
      expect(subject.capacity).to eql Airport::DEFAULT_CAPACITY
    end

    describe 'take off' do
      it 'instructs a plane to take off' do
        is_expected.to respond_to :instruct_to_take_off
      end

      it 'releases a plane' do
        subject.instruct_to_land plane
        subject.instruct_to_take_off plane
        expect(subject.hanger.include?(plane)).to be false
      end

      it 'instructs plane to take off' do
        expect(plane).to receive :take_off
        subject.instruct_to_land plane
        subject.instruct_to_take_off plane
      end

      it 'can only instruct planes within hanger to take off' do
        expect{subject.instruct_to_take_off(plane)}.to raise_error
         'That plane is not in hanger'
      end

      it "can't take off if flying" do
        subject.instruct_to_land plane
        subject.instruct_to_take_off plane
        expect{subject.instruct_to_take_off(plane)}.to raise_error
          'That plane is flying already'
      end
    end

    describe 'landing' do
      it 'instructs a plane to land' do
        (is_expected).to respond_to :instruct_to_land
      end

      it 'receives a landed plane' do
        subject.instruct_to_land plane
        expect(subject.hanger.include?(plane)).to be true
      end

      it 'can only land planes not in hanger' do
        subject.instruct_to_land plane
        expect{subject.instruct_to_land(plane)}.to raise_error
          'Plane already in hanger'
      end
    end
  end

    describe 'traffic control' do
      context 'when airport is full' do
        it 'does not allow a plane to land' do
          subject.capacity.times {subject.hanger << :plane}
          expect{subject.instruct_to_land(plane)}.to raise_error
           'Airport is full'
        end
      end

      context 'when weather conditions are stormy' do

        before(:each) do
         allow(subject).to receive(:stormy?) { true }
        end

        it 'does not allow a plane to take off' do
          expect{subject.instruct_to_take_off(plane)}.to raise_error
            'Cannot take off in stormy weather'
        end
        it 'does not allow a plane to land' do
          expect{subject.instruct_to_land(plane)}.to raise_error
           'Cannot land in stormy weather'
        end
      end
    end
end
