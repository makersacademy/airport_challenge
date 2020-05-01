require './airport.rb'

describe Airport do
  subject(:airport) { described_class.new('location') }

  describe '#initialize' do
    it 'has a set capacity with a default of 200' do
      expect(subject.total_capacity).to eq(200)
    end

    it 'can initialize with different capacity' do
      test = Airport.new(300, 'cardiff')
      expect(test.total_capacity).to eq(300)
    end

    it 'can initialize with different locations' do
      test = Airport.new('birmingham')
      expect(test.location).to eq('birmingham')
    end

    it 'can initialize with a random number of planes in airport' do
      subject.invent_plane_inside_airport
      subject.invent_plane_inside_airport
      expect(subject.check_capacity).to eq(198)
    end

    # it 'checks initialized planes inside airport are added to the plane log' do
    #   test = Airport.new('liverpool')
    #   allow(test).to receive(:invent_plane_inside_airport) { 321 }
    #   expect(test.check_plane_log(321)).to eq(true)
    # end
  end

  describe '#capacity' do
    it 'can reduce the capacity by 1 when 1 plane lands there' do
      allow(subject).to receive(:check_weather) { false }
      subject.land(222)
      expect(subject.check_capacity).to eq(199)
    end

    it 'can reduce the capacity by 2 when 2 planes land there' do
      allow(subject).to receive(:check_weather) { false }
      subject.land(234)
      subject.land(2343)
      expect(subject.check_capacity).to eq(198)
    end

    it 'can reduce the capacity by several when many planes lands there' do
      allow(subject).to receive(:check_weather) { false }
      subject.land(523)
      subject.land(444)
      subject.land(111)
      subject.land(123)
      expect(subject.check_capacity).to eq(196)
    end
  end

  describe '#check_plane_log' do
    it 'can tell you whether a plane is in the airport' do
      subject.plane_log_add(123)
      expect(subject.check_plane_log(123)).to eq(true)
    end

    it 'can tell you when planes are not in the airport' do
      expect(subject.check_plane_log(155)).to eq(false)
    end
  end

  describe '#plane_log_add' do
    it 'can add the plane to the plane log' do
      subject.plane_log_add(123)
      expect(subject.check_plane_log(123)).to eq(true)
    end

    it 'adds plane to airport log when it lands' do
      allow(subject).to receive(:check_weather) { false }
      subject.land(999)
      expect(subject.check_plane_log(999)).to eq(true)
    end
  end

  describe '#plane_log_remove' do
    it 'can remove the plane from the plane log' do
      subject.plane_log_add(333)
      subject.plane_log_delete(333)
      expect(subject.check_plane_log(333)).to eq(false)
    end

    it 'removes plane from airport log when it has taken off' do
      subject.plane_log_add(333)
      allow(subject).to receive(:check_weather) { false }
      expect(subject.take_off(333)).to eq("This plane number 333 has left location airport.")
    end
  end

  describe '#check_weather' do
    it 'can check whether the weather is stormy' do
      allow(subject).to receive(:check_weather) { true }
      expect(subject.check_weather).to eq(true)
    end

    it 'can check whether the weather is not stormy' do
      allow(subject).to receive(:check_weather) { false }
      expect(subject.check_weather).to eq(false)
    end
  end

  describe '#take_off' do
    it 'does not allow a plane to take off if it is not at the airport' do
      allow(subject).to receive(:check_weather) { false }
      expect(subject.take_off(322)).to eq("This plane is not in this airport, it cannot take off.")
    end

    it 'will not allow a plane to take off while weather is stormy' do
      subject.plane_log_add(333)
      allow(subject).to receive(:check_weather) { true }
      expect(subject.take_off(333)).to eq("You cannot fly it is too stormy.")
    end

    it 'will allow a plane to take off while weather is not stormy' do
      subject.plane_log_add(3234)
      allow(subject).to receive(:check_weather) { false }
      expect(subject.take_off(3234)).to eq("This plane number 3234 has left location airport.")
    end
  end

  describe '#land' do
    it 'does not allow a plane to land if there is not capacity at airport' do
      test = Airport.new(0, "loughborough")
      allow(test).to receive(:check_weather) { false }
      expect(test.land(9876)).to eq"loughborough airport has 0 spaces left, your plane cannot land at this time."
    end

    it 'will not allow a plane to land while weather is stormy' do
      test = Airport.new("loughborough")
      allow(test).to receive(:check_weather) { true }
      expect(test.land(9876)).to eq("You cannot land it is too stormy.")
    end

    it 'will allow a plane to land while weather is not stormy' do
      allow(subject).to receive(:check_weather) { false }
      expect(subject.land(9876)).to eq([9876])
    end
  end
end
