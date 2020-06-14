require 'airport.rb'

describe 'Airport' do

  it 'creates an instance of the Airport class' do
    expect(Airport.new).to be_an_instance_of(Airport)
  end

end
