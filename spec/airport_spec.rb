require "airport"

describe Airport do
  let(:weather_su) { double(:weather_su, :weather => :sunny) }
  let(:weather_st) { double(:weather_st, :weather => :stormy) }

  it 'sets capacity to arg value when initialised with a numerical arg' do
    expect(Airport.new(10).capacity).to eq 10
    expect(Airport.new("10").capacity).to eq 10
    expect(Airport.new(10.75).capacity).to eq 10
    expect(Airport.new(2 * 5).capacity).to eq 10
    expect(Airport.new([5,5].sum).capacity).to eq 10
  end

  it 'sets capacity to default when initialised without argument' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'returns error when initialised with non-numerical arg' do
    expect { Airport.new("ten") }.to raise_error 'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
    expect { Airport.new([10]) }.to raise_error 'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
  end

  it 'returns error when initialised with arg == 0' do
    expect { Airport.new(0) }.to raise_error 'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
  end

  describe '#check_weather' do
    it 'sets @weather to a weather symbol (:sunny or :stormy) when called' do
      subject.check_weather(weather_su)
      expect(subject.weather).to eq :sunny
    end

    it 'provides a new weather symbol and sets @weather to equal it' do
      srand(3)
      subject.check_weather(weather_su)
      expect(subject.weather).to eq :sunny
      srand(4)
      subject.check_weather(weather_st)
      expect(subject.weather).to eq :stormy
    end
  end

  describe '#request_launch' do
    it 'raises an error when anything other than a Plane is passed as an arg' do
      expect { subject.request_launch("Plane") }.to raise_error 'Call error: must include a Plane as an argument'
      expect { subject.request_launch(Plane.new) }.to_not raise_error
    end

    it 'can launch a plane in right conditions' do
      test_plane = Plane.new
      srand(3)
      subject.add_to_hangar(test_plane)
      expect(subject.request_launch(test_plane)).to eq test_plane
    end
  end

  describe '#weather_is_clear' do
    it 'returns false during stormy weather' do
      srand(4)
      expect(subject.weather_is_clear(true)).to eq false
    end
  end

  describe '#plane_is_in_hangar' do
    it 'returns false when plane isn\'t in hangar' do
      expect(subject.plane_is_in_hangar(Plane.new)).to eq false
    end

    it 'returns true when plane is in hangar' do
      new_plane = Plane.new
      subject.add_to_hangar(new_plane)
      expect(subject.plane_is_in_hangar(new_plane)).to eq true
    end
  end

  describe '#request_land' do
    it 'can land a plane in right conditions' do
      test_plane = Plane.new
      srand(3)
      expect(subject.request_land(test_plane)).to eq test_plane
    end

    it 'cannot land a plane if the hangar is full' do
      20.times { subject.add_to_hangar(:plane) }
      srand(3)
      expect(subject.request_land(Plane.new)).to eq false
    end
  end

  it 'can land a plane, launch it, and land it again' do
    test_plane = Plane.new
    srand(3)
    subject.request_land(test_plane)
    subject.request_launch(test_plane)
    expect(subject.request_land(test_plane)).to eq test_plane
  end

end
