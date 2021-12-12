require 'airport'

describe Airport do
    it 'responds to max capacity' do
        expect(subject).to respond_to :max_capacity
    end 
end 