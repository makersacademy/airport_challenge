require 'system_designer'
require 'airport'

describe SystemDesigner do
  it 'changes airport capacity' do
    airport = Airport.new(30)
    expect(airport.capacity).to eq(30)
  end
end
