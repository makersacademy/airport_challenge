require 'capybara/rspec'
require 'airport'

feature 'Grand Finale' do

  airport = Airport.new
  planes = []
  6.times { planes << Plane.new }
  p = Plane.new

  scenario '6 planes can be created' do
    expect(planes.length).to eq 6
  end

  scenario 'airport knows planes are in the air' do
    planes.each do |plane|
      expect(plane.location).to eq('air')
    end
  end

  scenario '6 planes can land at specified airport' do
    Airport.any_instance.stub(:weather_good?).and_return(true)
    planes.each { |plane| plane.request_land airport }
    expect(airport.landed_planes.length).to eq 6
  end

  scenario 'airport knows planes are in the airport' do
    planes.each do |plane|
      expect(plane.location).to eq('airport')
    end
  end

  scenario 'plane is denied landing permission when airport is full' do
    Airport.any_instance.stub(:weather_good?).and_return(true)
    expect { (p.request_land airport) }.to raise_error 'permission denied'
  end

  scenario '6 landed planes have status: landed' do
    airport.landed_planes.each do |plane|
      expect(plane.status).to eq 'landed'
    end
  end

  scenario 'after all 6 planes takeoff there are no more landed planes' do
    Airport.any_instance.stub(:weather_good?).and_return(true)
    planes.each do |plane|
      airport.order_plane_takeoff plane
    end
    expect(airport.landed_planes.length).to eq 0
  end

  scenario 'after all 6 planes takeoff their status is \'flying\'' do
    planes.each do |plane|
      expect(plane.status).to eq 'flying'
    end
  end
end
