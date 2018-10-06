require 'airport.rb'

describe Airport do
  # is there a plane?
  it { is_expected.to respond_to :land }
  it 'can instruct a plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(true)
  end
end
#USERSTORY 2 attempt 2
#  it 'is plane here?' do
  #  if status(true)
  #    expect(subject.take_off).to eq('Ready to takeoff')
#    elsif status(false)
#      expect(subject.take_off).to eq('Plane has left the airport')
#    end
#  end
#end

#USERSTORY 2 Attempt 1
  #it 'is plane here?' do

    #  if :status == true then
    #    expect(subject.status).to eq('Ready to takeoff') #unless Airport.take_off(plane) == true
  #    elsif :status == false then
    #    expect(subject.status).to eq('Plane has left the airport')
  #  end

  #end

  #it 'Check if weather is stormy'
  # expect subject.weather.to be_stormy?
#end
