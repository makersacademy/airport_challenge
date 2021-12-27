# This is the file that the spec file goes to check for the airport class
require 'airport'

describe Airport do 
    it 'responds to land' do 
        expect(subject).to respond_to(:land).with(1).argument
    end 
end 