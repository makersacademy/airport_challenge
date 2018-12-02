require 'safety'

RSpec.describe do

  safety = Safety.new

  it 'will instruct whether it is safe to takeoff' do
    expect(safety).to respond_to(:instruct_take_off)
  end

  it 'will instruct whether it is safe to land' do
    expect(safety).to respond_to(:instruct_land)
  end

end
