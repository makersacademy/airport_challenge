require 'airport'
require 'plane'
describe Airport do

  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :take_off
    end
    it 'releases a plane' do
      plane = Plane.new
      subject.land plane
      expect(plane).not_to be_flying
      subject.take_off plane
      expect(plane).to be_flying
    end     
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'receives a plane' do
      plane = Plane.new
      subject.land plane
      expect(plane).to be_landed
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane = Plane.new
        subject.capacity.times {subject.land(plane)}
        expect{ subject.land(plane) }.to raise_error "#{subject.class.name} is full" 
      end
    end

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        plane = Plane.new
        subject.land plane
        subject.random_weather(3)
        expect{ subject.take_off plane }.to raise_error "Weather is stormy. You may not take off from #{subject.class.name}"
      end
      it 'does not allow a plane to land' do
        subject.random_weather(3)
        plane = Plane.new
        expect{ subject.land plane }.to raise_error "Weather is stormy. You may not land at #{subject.class.name}"
      end
    end
  end
end