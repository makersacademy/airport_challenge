require_relative '../lib/airport.rb'

describe Airport do

  describe 'Default Capacity with Override' do

    it 'Airport has a default capacity attribute(instance_variable)' do
      expect(subject).
        to have_attributes(:default_capacity => Airport::DEFAULT_CAPACITY)
    end

    it '[KEY BEHAVIOUR]Airport has a default capacity & can be over-ridden' do
      expect(Airport.new(30).instance_variable_get(:@default_capacity)).
        to eq(30)
    end

  end

  describe 'Planes at Airport' do

    it 'Airport planes attr @planes exists' do
      expect(subject.instance_variable_get(:@planes)).to be
    end

    it 'Airport can store/accept planes as array' do
      expect(subject.instance_variable_get(:@planes).class.name).
        to eq('Array')
    end

  end

  describe 'Landing behaviour' do

    it 'Airport method instruct_plane_to_land exists' do
      expect(subject).to respond_to(:instruct_plane_to_land)
    end

    it 'instruct_plane_to_land exists takes Plane as argument' do
      expect(subject).to respond_to(:instruct_plane_to_land).
        with(1).arguments
    end

    it 'once plane has landed it is in airport @planes array' do
      plane = (double(:Plane, plane_landing: "Landed" ))
      allow(subject).to receive(:weather_check).and_return("sunny")#
      subject.instruct_plane_to_land(plane)
      expect(subject.instance_variable_get(:@planes)).to eq [plane]
    end

    it '[Key Behaviour] Refuse landing if airport full' do

      plane = (double(:Plane,:plane_landing => "Landed"))
      allow(subject).to receive(:weather_check).and_return("sunny")
      subject.instruct_plane_to_land(plane)
      expect {subject.instruct_plane_to_land(plane)}.
        to raise_error("Airport full: Landing Denied")
    end

  end

  describe 'Taking Off' do

    it 'Airport method instruct_plane_to_take_off exists' do
      expect(subject).to respond_to(:instruct_plane_to_take_off)
    end

    it 'instruct_plane_to_take_off exists takes Plane as argument' do
      expect(subject).to respond_to(:instruct_plane_to_take_off).
        with(1).arguments
    end

    it 'once plane has taken off is not in airport (@planes array)' do
      allow(subject).to receive(:weather_check) {"sunny"}
      plane = (double(:Plane, plane_landing: "In-Flight",
        plane_taking_off: "Landed" ))
      subject.instruct_plane_to_land(plane)
      subject.instruct_plane_to_take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

  end

  describe 'weather check' do

    it 'raises error when take off attempted udner stormy conditions' do
      allow(subject).to receive(:weather_check).and_return("sunny")
      plane = (double(:Plane, :plane_landing => "Landed"))
      subject.instruct_plane_to_land(plane)
      allow(subject).to receive(:weather_check).and_return("stormy")
      expect{subject.instruct_plane_to_take_off(plane)}.to raise_error
    end

    it 'raises error when landing attempted udner stormy conditions' do
      plane = (double(:Plane, :plane_landing => "Landed"))
      allow(subject).to receive(:weather_check).and_return("stormy")
      expect{subject.instruct_plane_to_land(plane)}.to raise_error
    end

  end

end
