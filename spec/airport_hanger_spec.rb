require 'airport_hanger'
describe AirportHanger do
airport_hanger = AirportHanger.new
it{expect(airport_hanger).to be_instance_of(AirportHanger)}
end
describe AirportHanger do
  airport_hanger = AirportHanger.new
  it{expect(airport_hanger).to respond_to :plane}
end
describe AirportHanger do
  airport_hanger = AirportHanger.new
  it{expect(airport_hanger).to respond_to(:instruct).with(2).arguments}
end
