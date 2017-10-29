require_relative 'airport'
require_relative 'plane'

class Two_Way_Journey

  def initialize
    @plane = Plane.new
    @airport_1 = Airport.new
    @airport_2 = Airport.new
  end

#1. Takes off from airport 1
#1A Given a plane on airport1
  def start
    @plane.land(@airport_1)
    second
  end
#1B Asking permission to take off until weather allows
  def second
    @plane.take_off(@airport_1)
    return third if @plane.status == :flying
    second
  end
#1C It should take off and have its status set to flying
  def third
    puts "1A Fine"
    puts "1B Fine"
    return fourth if @plane.status == :flying
    abort("1C failed")
  end
#1D And current airport set to nil
  def fourth
    puts "1C Fine"
    return fifth if @plane.current_airport == nil
    abort("1D failed")
  end

#2. Plane is instructed to take_off while flying
#2A Gets instruction
  def fifth
    puts "1D Fine"
    @plane.take_off(@airport1)
    return sixth
  end
#2B Doesn't take_off (still flying and in no airport)
  def sixth
    puts "2A Fine"
    return seventh if @plane.status == :flying && @plane.current_airport == nil
    abort("2B failed")
  end

#3. Lands on airport2
#3A Requests permission to land
  def seventh
    puts "2B Fine"
    @plane.land(@airport_2)
    eighth
  end
#3B Has landed
  def eighth
    puts "3A Fine"
    return ninth if @plane.status == :ground && @plane.current_airport == @airport_2
    abort("3B failed") 
  end

#4. Is instructed to land while on the ground
#4A Gets instruction
  def ninth
    puts "3B Fine"
    @plane.land(@airport_1)
    tenth
  end
#4B Ignored instruction
  def tenth
    puts "4A Fine"
    return eleventh if @plane.status == :ground && @plane.current_airport == @airport_2
    abort("4B failed")
  end

#5. Asks permission to take off to wrong airport
#5A Asks permission
  def eleventh
    puts "4B Fine"
    @plane.take_off(@airport_1)
    twelfth
  end
#5B Permission denied
  def twelfth
    puts "5A Fine"
    return th_th if @plane.status == :ground && @plane.current_airport == @airport_2 
    abort("5B failed")
  end

#6. Takes off from airport2
#6A Requests take off
  def th_th
    puts "5B Fine"
    @plane.take_off(@airport_2)
    fo_th
  end
#6B Took off
  def fo_th
    puts "6A Fine"
    return fi_th if @plane.status == :flying && @plane.current_airport == nil
    abort("6B failed")
  end

#7. Asks permission to land at airport1 but airport1 is full
#7A Fills airport1
  def fi_th
    puts "6B Fine"
    20.times { @airport_1.grounded_planes << Plane.new }
    si_th
  end
#7B Request permission
  def si_th
    @plane.land(@airport_1)
    se_th
  end
#7C Permission was denied, still flying
  def se_th
    puts "7B Fine"
    return ei_th if @plane.status == :flying && @plane.current_airport == nil
    abort("7C failed")
  end

#8. Returns
#8A Slot emptied at airport1, again request permission to land
  def ei_th
    puts "7C Fine"
    @airport_1.grounded_planes.pop
    @plane.land(@airport_1)
    ni_th
  end
#8B Landed at airport1
  def ni_th
    puts("8A Fine")
    return tw_th if @plane.status == :ground && @plane.current_airport == @airport_1
    abort("8B Failed")
  end

#9 Returns successfull test
  def tw_th
    return "Test Successfull"
  end

end
