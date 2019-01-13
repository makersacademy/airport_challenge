require 'plane'
require 'airport'

RSpec.describe Plane do

  let(:airport) { Airport.new }
  let(:subject) { Plane.new(airport) }
  
  it 'has a default status' do
    expect(subject.status).to eq "landed"
  end

  it 'allows status update' do
    subject.status = 'in flight'
    expect(subject.status).to eq 'in flight'
  end

end
