require 'airport'
require 'weatherservice'


describe Airport do

  subject do
    weatherservice = instance_double 'Weatherservice'
    allow(weatherservice).to receive(:weather) { 'sunny' }
    Airport.new(weatherservice)
  end


  describe 'take off' do
    it 'instructs a plane to take off' do
      plane = Plane.new
      subject.apron << plane
      subject.take_off plane
      expect(plane).to be_airborne
    end

    it 'only airplanes on the apron can take off' do
      plane = Plane.new
      expect{subject.take_off plane}.to raise_error "Plane not on apron"
    end

    it 'when a plane takes off it is airborne' do
      leaving_plane = Plane.new
      subject.apron << leaving_plane
      subject.take_off leaving_plane
      expect(leaving_plane).to be_airborne
    end
  end


  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to :land
    end

    it 'whan a plane lands it parks on the apron' do
      landing_plane = Plane.new
      subject.land landing_plane
      expect(subject.apron[0]).to eq landing_plane
    end

    it 'when a plane lands it is not airborne' do
      landing_plane = Plane.new
      subject.land landing_plane
      expect(landing_plane).not_to be_airborne
    end
  end


  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        20.times {subject.land Plane.new}
        expect {subject.land Plane.new}.to raise_error "Airport is full"
      end
    end
  end


  context 'when weather conditions are stormy' do
    subject do
      weatherservice = instance_double 'Weatherservice'
      allow(weatherservice).to receive(:weather) { 'stormy' }
      Airport.new(weatherservice)
    end

    it 'does not allow a plane to take off' do
      leaving_plane = Plane.new
      subject.apron << leaving_plane
      expect{subject.take_off leaving_plane}.to raise_error 'Weather is stormy'
    end

    it 'does not allow a plane to land' do
      landing_plane = Plane.new
      expect{subject.land landing_plane}.to raise_error 'Weather is stormy'
    end
  end
end
