require 'airport'
require 'plane'

describe Airport do

  describe '#land' do
    context 'weather is good' do
      let (:good_weather) { double(:good_weather, :stormy? => false) }
      let (:subject) { Airport.new(good_weather) }
      let (:plane) { double(:plane) }

      it 'creates new airport object' do
        expect(Airport.new.is_a? Airport).to eq true
      end

      it { is_expected.to respond_to :land }
      it { is_expected.to respond_to :take_off }

      it 'instructs plan to land and returns a plane instance in an array' do
        plane = Plane.new
        expect(subject.land(plane)).to eq [plane]
      end

      it 'instructs an instance of plane to land and returns a list of planes' do
        plane1 = Plane.new
        plane2 = Plane.new
        subject.land(plane1)
        expect(subject.land(plane2)).to eq [plane1, plane2]
      end

      it 'checks plane is no longer on plane list' do
        plane = Plane.new
        subject.land(plane)
        subject.take_off
        expect(subject.plane_list).not_to include plane
      end
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off and returns plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'raises error message when passed take_off and weather is stormy' do
      subject = Airport.new(double :stormy_weather, :stormy? => true)
      expect{subject.take_off}.to raise_error 'Cannot take off due to stormy weather'
    end
  end
end
