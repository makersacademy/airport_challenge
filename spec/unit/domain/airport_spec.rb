require 'domain/airport'
require 'domain/aeroplane'

describe Airport do
let(:subject) { described_class.new("Heathrow", :MAP) }


  describe '#print_airport_name' do
    it 'displays the name of the airport' do
      expect(subject.airport_name).to eq "Heathrow"
    end
  end

  describe '#prepare_for_landing' do
    context 'on a clear runway' do
      it 'updates the runway to be expecting a plane to land' do
        plane_id = :ABCDEFGH
        expect(subject.prepare_for_landing(plane_id)).to eq :ok
        expect(subject.runway_status).to eq Airport::LANDING
        expect(subject.plane_on_runway).to eq plane_id
      end
    end
    
    context 'on a busy runway' do
      it 'returns :busy for an attemped landing' do
        plane_on_runway = :PLANE_ON_RUNWAY
        subject.prepare_for_landing(plane_on_runway)

        plane_id = :NEXT_PLANE
        expect(subject.prepare_for_landing(plane_id)).to eq :busy
      end
    end

    context 'a full airport' do
      it 'returns :full for an attemped landing' do
        airport = Airport.new("Busy Airport", :LHR, 1)
        plane1 = :AAA
        plane2 = :AAA
        airport.prepare_for_landing(plane1)
        airport.land
        expect(airport.prepare_for_landing(plane2)).to eq :full

      end
    end
  end

  describe '#land' do
    it 'increments the airport plane count and removes the plane from the runway' do
      plane_id = :ABCDEFGH
      subject.prepare_for_landing(plane_id)
      expect(subject.land).to eq :ok
      expect(subject.runway_status).to eq :empty
      expect(subject.plane_count).to eq 1
    end

    context 'No plane cleared to land' do
      it 'returns a message to say no planes have been cleared to land' do
        expect(subject.land).to eq "No planes cleared for landing"
      end
    end

    context 'when a plane has been cleared for take-off' do
      it 'will not be able to land' do
        plane_id = :ABCDEFGH
        subject.prepare_for_take_off(plane_id)
        expect(subject.land).to eq "No planes cleared for landing"
      end
    end
  end

  describe '#prepare_for_take_off' do

    context 'on a clear runway' do
      it 'moves a plane from the terminal to the runway' do
        plane = :PLANE_ON_RUNWAY
        subject.prepare_for_take_off(plane)
        expect(subject.runway_status).to eq Airport::TAKE_OFF
        expect(subject.plane_on_runway).to eq plane
      end
    end

    context 'on a busy runway' do
      it 'returns :busy for an attemped landing' do
        plane_on_runway = :PLANE_ON_RUNWAY
        subject.prepare_for_landing(plane_on_runway)

        plane_id = :NEXT_PLANE
        expect(subject.prepare_for_take_off(plane_id)).to eq :busy
      end
    end
  end

  describe '#take_off' do
    it 'decrement the airport plane count and removes the plane from the runway' do
      plane_id = :ABCDEFGH
      
      subject.prepare_for_landing(plane_id)
      subject.land

      subject.prepare_for_take_off(plane_id)
      expect(subject.take_off).to eq :ok
      expect(subject.runway_status).to eq :empty
      expect(subject.plane_count).to eq 0
    end

    context 'No plane cleared to land' do
      it 'returns a message to say no planes have been cleared to land' do
        expect(subject.land).to eq "No planes cleared for landing"
      end
    end

    context 'when a plane has been cleared for landing' do
      it 'will not be able to take-off' do
        plane_id = :ABCDEFGH
        subject.prepare_for_landing(plane_id)
        expect(subject.take_off).to eq "No planes cleared for landing"
      end
    end

    #plane cleared to land so runway == busy, currently this means if the 
    #take-off method is called, the plane that is actually waiting to land
    #will 'take off' technically
  end

end
