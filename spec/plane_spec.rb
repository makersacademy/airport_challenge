require 'plane'

describe Plane do

  it 'responds to allowed_take_off method' do
    expect(subject).to respond_to :allowed_take_off
  end

  it 'responds to _left_airport? method' do
    expect(subject).to respond_to :left_airport?
  end
  
  it 'after allowed_take_off returns true for left_airport?' do
    subject.allowed_take_off
    expect(subject).to be_left_airport
  end

  it 'responds to allowed_land method' do
    expect(subject).to respond_to :allowed_land
  end

  it 'after allowed_land returns false for left_airport' do
    subject.allowed_land
    expect(subject).not_to be_left_airport
  end

end