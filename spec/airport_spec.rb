require 'airport'

describe Airport do

  let(:plane) {instance_double("Plane", taken_off: true)}

  describe '#take_off' do

    it {is_expected.to respond_to(:take_off)}

    context 'when stormy' do
      it 'prevents take off' do
        allow(Weather).to receive(:stormy?) {false}
        subject.land(plane)
        allow(Weather).to receive(:stormy?).and_return(true)
        expect{subject.take_off(plane)}.to raise_error 'The weather is too stormy right now!'
      end
    end

    context 'when not stormy' do

      let(:spitfire) {Plane.new}

      before(:example) do
        allow(Weather).to receive(:stormy?).and_return(false)
      end

      it 'allows for planes to take off at random by deafault' do
        subject.land(plane)
        expect(subject.take_off).to eq(plane)
      end

      it 'raises an error when there are no planes to take off' do
        expect{subject.take_off}.to raise_error 'There are no planes to take off!'
      end

      it 'takes off a specific plane if an argument is given' do
        subject.land(spitfire)
        5.times {subject.land(Plane.new)}
        expect(subject.take_off(spitfire)).to eq(spitfire)
      end

      it 'raises an error if a specified plane is not at the airport' do
        5.times {subject.land(Plane.new)}
        expect{subject.take_off(spitfire)}.to raise_error 'That plane is not at this airport!'
      end

    end

  end

  describe '#land' do

    it {is_expected.to respond_to(:land).with(1).argument}

    context 'when stormy' do

      before(:example) do
        allow(Weather).to receive(:stormy?).and_return(true)
      end

      it 'prevents landing' do
        expect{subject.land(plane)}.to raise_error 'The weather is too stormy right now!'
      end

    end

    context 'When not stormy' do

      before(:example) do
        allow(Weather).to receive(:stormy?).and_return(false)
      end

      it 'allows for planes to land' do
        expect(subject.land(plane)).to eq "A plane has landed!"
      end

      it 'raises an error if a plane tries to land in a full airport' do
        Airport::DEAFAULT_CAPACITY.times {subject.land(Plane.new)}
        expect{subject.land(Plane.new)}.to raise_error 'Too many planes at this aiport!'
      end

      it 'raises an error if an already landed plane tries to land' do
        subject.land(plane)
        expect {subject.land(plane)}.to raise_error 'This plane has already landed!'
      end

    end

  end

  describe '#build_plane' do

    it 'allows for building of new planes' do
      expect(subject.build_plane.last).to be_landed
    end

    it 'does not allow a plane to be built if capacity is reached' do
      allow(Weather).to receive(:stormy?) {false}
      subject.capacity.times {subject.land(Plane.new)}
      expect{subject.build_plane}.to raise_error 'Too many planes at this aiport!'
    end

  end

  describe '#capacity' do

    it 'allows for setting custom capacity' do
      airport = Airport.new(500)
      expect(airport.capacity).to eq(500)
    end

    it 'has a deafault capacity set if no arg is given' do
      airport = Airport.new
      expect(airport.capacity).to eq(Airport::DEAFAULT_CAPACITY)
    end

  end

end
