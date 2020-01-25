require 'airport'

describe Airport do
    it 'checks an airport exists' do
    expect(Airport).to be_truthy 
    end

    it 'returns Plane has landed"' do
    expect(Airport.new.land).to eq("A plane has landed")
    end
end