# This is the file that the spec file goes to check for the airport class
require 'airport'

describe Airport do 
    subject(:airport) { described_class.new }

    it 'airport instructs a plane to land (responds to land method)' do 
        expect(airport).to respond_to(:land).with(1).argument
    end 
end 