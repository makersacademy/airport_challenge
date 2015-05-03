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

  scenario 'airport knows planes are airborn' do
    planes.each do |x|
      expect(x.location).to eq('air')
    end
  end

end
