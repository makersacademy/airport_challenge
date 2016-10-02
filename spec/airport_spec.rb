require 'airport'

describe Airport do
    
    describe 'initialize' do
    end
        
    describe '#land()' do
    #it { is_expected.to respond_to (:land) }

    it 'should know when a plane has landed' do
    trial_airport = Airport.new
    trial_plane = Plane.new
    trial_airport.land(trial_plane)
    expect(trial_airport.land(trial_plane).pop).to eq trial_plane
    end
    end

    describe '#depart()' do
    #it { is_expected.to respond_to (:depart) }
    
    it 'should know when a plane has departed' do
    trial_airport = Airport.new
    trial_plane = Plane.new
    trial_airport.land(trial_plane)
    trial_airport.depart(trial_plane)
    expect(trial_airport.flight_checker(trial_plane)).to eq false
    end
    end
end