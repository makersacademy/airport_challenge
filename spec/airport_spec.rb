require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  puts "-------CREATE NEW PLANE-------"

  it "checks that airport responds to create_new_plane" do
  expect(subject).to respond_to :create_new_plane
  end

  puts "-------LAND THE PLANE---------"

  it "checks that airport responds to land" do
  expect(subject).to respond_to :land
  end
  it "checks that airport responds to land method with 1 argument" do
  expect(subject).to respond_to(:land).with(1).argument
end
it "checks that airport lands plane and returns it" do
plane1 = subject.create_new_plane
expect(subject.land(plane1)).to eq [plane1]
end

puts 'CHECK IF SPECIFIED PLANE HAS LANDED'

it "checks that airport responds to landed?" do
  expect(subject).to respond_to :landed?
end
it "checks that airport responds to landed? with 1 argument" do
  expect(subject).to respond_to(:landed?).with(1).argument
end
it "checks if specified plane has landed in airport" do
plane1 = subject.create_new_plane
subject.land(plane1)
expect(subject.landed?(plane1)).to eq true
end
end
