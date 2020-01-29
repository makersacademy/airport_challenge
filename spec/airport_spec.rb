require 'airport.rb'
require 'plane.rb'



describe Airport do

  before(:each) do
    @airport = Airport.new
    allow(@airport).to receive(:weather) { 'sunny' }
    @plane = Plane.new
    @plane.land(@airport)
  end

  it 'Landing a plane should result in num_of_plane increase by 1' do
    expect(@airport.num_of_planes).to eq(1)
  end

  it 'Take off should result in num_of_plane reduce by one' do
    @plane.take_off(@airport)
    expect(subject.num_of_planes).to eq(0)
  end

end
