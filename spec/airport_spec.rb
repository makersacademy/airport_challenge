require 'airport'

describe Airport do
    
   
    airport = Airport.new


    it 'no error from Airport class' do
        expect{subject}.not_to raise_error
    end

    it 'no error from "land_plane" method' do
        expect{airport.land_plane(airport.instance_variable_get(:@fleet)[0])}.not_to raise_error
    end

    it '"land_plane" changes the location of the plane to the airport' do
        allow(airport).to receive(:weather){ "sun" }
        airport.instance_variable_get(:@fleet)[0].instance_variable_set(:@location, "air")
        airport.land_plane(airport.instance_variable_get(:@fleet)[0])
        expect(airport.instance_variable_get(:@fleet)[0].instance_variable_get(:@location)).to eq "airport"
    end

    it 'no error from "take_off" method' do
        allow(airport).to receive(:weather){ "sun" }
        airport.instance_variable_get(:@fleet)[0].instance_variable_set(:@location, "airport")
        expect{airport.take_off(airport.instance_variable_get(:@fleet)[0])}.not_to raise_error
    end

    it '"land_plane" returns "false" when "parked_planes" >= "airport_capacity"' do
        airport.instance_variable_set(:@airport_capacity, 1)
        airport.instance_variable_get(:@fleet)[0].instance_variable_set(:@location, "airport")
        airport.instance_variable_get(:@fleet)[1].instance_variable_set(:@location, "airport")
        airport.instance_variable_get(:@fleet)[2].instance_variable_set(:@location, "air")
        expect(airport.land_plane(airport.instance_variable_get(:@fleet)[3])).to eq false
    end

    it '"set_capacity" value changes to 10' do
        airport.set_capacity(10)
        expect(airport.instance_variable_get(:@airport_capacity)).to eq 10
    end

    it '"weather" returns a value' do
        expect(airport.weather).not_to eq nil
    end

    it '"land_plane" returns false if weather is stormy' do
        allow(airport).to receive(:weather){ "storm" }
        airport.instance_variable_get(:@fleet)[2].instance_variable_set(:@location, "air")
        expect(airport.land_plane(airport.instance_variable_get(:@fleet)[2])).to eq false
    end

    it '"take_off" returns false if weather is stormy' do
        allow(airport).to receive(:weather){ "storm" }
        airport.instance_variable_get(:@fleet)[1].instance_variable_set(:@location, "airport")
        expect(airport.take_off(airport.instance_variable_get(:@fleet)[1])).to eq false
    end

    it '"take_off" returns false if the plane is in the air' do
        allow(airport).to receive(:weather){ "sun" }
        airport.instance_variable_get(:@fleet)[2].instance_variable_set(:@location, "air")
        expect(airport.take_off(airport.instance_variable_get(:@fleet)[2])).to eq false
    end

    it '"land_plane" changes the plane location to the airport' do
        allow(airport).to receive(:weather){ "sun" }
        airport.instance_variable_get(:@fleet)[2].instance_variable_set(:@location, "air")
        airport.land_plane(airport.instance_variable_get(:@fleet)[2])
        expect(airport.instance_variable_get(:@fleet)[2].instance_variable_get(:@location)).to eq "airport"
    end


end