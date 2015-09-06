require 'airport'
require 'plane'

describe Airport do

  it 'Airport has a capacity' do
    expect(subject.capacity).to eql Airport::DEFAULT_CAPACITY
  end

  describe 'take off' do
    it 'instructs a plane to take off' do
      is_expected.to respond_to :instruct_to_take_off
    end

    it 'releases a plane' do
      plane = Plane.new
      plane.status = "landed"
      subject.hanger = [plane]
      subject.instruct_to_take_off plane
      expect(subject.hanger.include?(plane)).to be false
    end

    it 'changes status to flying' do
      plane = Plane.new
      plane.status = "landed"
      subject.hanger = [plane]
      subject.instruct_to_take_off plane
      expect(plane.status).to eql "flying"
    end

    it 'can only instruct planes within hanger to take off' do
      plane = Plane.new
      expect{subject.instruct_to_take_off(plane)}.to raise_error
       'That plane is not in hanger'
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      (is_expected).to respond_to :instruct_to_land
    end

    it 'receives a plane' do
      plane = Plane.new
      subject.instruct_to_land plane
      expect(subject.hanger.include?(plane)).to be true
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane = Plane.new
        subject.capacity.times {subject.hanger << :plane}
        expect{subject.instruct_to_land(plane)}.to raise_error 'Airport is full'
      end
    end

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        subject.stub(:rand).and_return( 1 )
        plane = Plane.new
        subject.hanger << plane
        expect{subject.instruct_to_take_off(plane)}.to raise_error
          'Cannot take off in stormy weather'
      end
      it 'does not allow a plane to land' do
        subject.stub(:rand).and_return( 1 )
        plane = Plane.new
        expect{subject.instruct_to_land(plane)}.to raise_error
         'Cannot land in stormy weather'
      end
    end
  end
end
