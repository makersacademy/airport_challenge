# /Users/shereen/Google Drive/Projects/airport_challenge/spec/airport_spec.rb

require "airport"

describe Airport do

  #1st test
  it {is_expected.to respond_to :plane_landed?}

  #2nd test
  it 'receives a plane' do
    plane = subject.plane_landed?
    # expect(plane).to be_confirm_landed?
    expect(plane).to respond_to :confirm_landed?
  end


end
