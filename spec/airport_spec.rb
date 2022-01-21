require 'airport'

describe Airport do

  it 'can land a plane' do
    lennon = Airport.new
    expect(subject.land_sunny).to eq "Landed safely"
  end

  it 'can tell a plane to take off and confirm' do
    lennon = Airport.new
    expect(lennon.take_off_sunny).to eq "Plane left hangar safely"
  end

  it 'can prevent landing plane when hangar is full' do
    lennon = Airport.new
    subject.land_sunny
    # then try again when full
    expect{subject.land_sunny}.to raise_error "Hangar is full"
  end

  it 'user can set hangar capacity' do
    lennon = Airport.new(5)
    expect(lennon.hangar_capacity).to eq 5
  end

  it 'hangar capacity will default to 10' do
    lennon = Airport.new
    expect(subject.hangar_capacity).to eq 10
  end

  it 'prevents take off if weather is stormy' do
    lennon = Airport.new
    expect{lennon.take_off_stormy}.to raise_error "Too dangerous to take off"
  end

  it 'prevents landing if weather is stormy' do
    lennon = Airport.new
    expect{lennon.land_stormy}.to raise_error "Too dangerous to land"
  end

end
