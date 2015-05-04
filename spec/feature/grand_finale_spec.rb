require 'capybara/rspec'
require 'airport'



feature 'working airport' do

  airport = Airport.new
  planes = []
  10.times { planes << Plane.new }
  plane = Plane.new

  scenario 'creating 10 planes' do
    expect(planes.length).to eq 10
  end

  scenario 'airport knows when planes are airborn' do
    planes.each do |x|
      expect(x.location).to eq('air')
  end
  scenario '10 planes can land at specified airport' do
    Airport.any_instance.stub(:weather_sunny?).and_return(true)
    planes.each { |p| p.land airport }
   expect(airport.landed_planes.length).to eq 10
  end

end
