require './lib/weather_1.rb' 

describe Weather do 
  it 'is a module' do 
    expect(Weather).to be_kind_of(Module)
  end

end 

