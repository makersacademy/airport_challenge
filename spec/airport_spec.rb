require 'airport'

describe Airport do

  plane = Plane.new

  describe '#land_plane' do
    it 'hangar receives a plane' do
      subject.land_plane(plane)
      expect(subject.hangar).to include(plane)
    end

    it 'throws error if hangar is full' do
      plane2 = Plane.new
      subject.land_plane(plane2)
      plane3 = Plane.new
      subject.land_plane(plane3)

      expect { subject.land_plane(plane) }.to raise_error 'No space in hangar'
    end
  end

  describe '#take_off in sunny weather' do
    sunny = "sunny"

    before do
      subject.land_plane(plane)
      subject.take_off(plane, sunny)
    end

    it 'removes plane from hangar' do
      expect(subject.hangar).not_to include(plane)
    end

    it 'confirms no plane in hangar' do
      expect(subject.take_off(plane, sunny)).to eq("No planes in hangar")
    end

  end


  describe '#take_off in stormy weather' do

    it 'prevents take off when weather is stormy' do
      stormy = Weather.new
      allow(stormy).to receive(:forecast).and_return("stormy")
      expect { subject.take_off(plane, stormy) }. to raise_error "You can't take off"
    end
  end

end

describe Plane do
  plane = Plane.new
  it 'checks plane is working' do
    expect(plane).to respond_to(:working?)
  end
end

describe Weather do
  weather = Weather.new

  it 'checks weather is working' do
    expect(weather).to respond_to(:working?)
  end

  it 'weather returns a string' do
    expect(weather.forecast).to be_a(String)
  end
end