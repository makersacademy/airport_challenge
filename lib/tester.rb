require './lib/airport.rb'

@airportlist = []
@airportlist << Airport.new
@airportlist << Airport.new(2)
@planeslist = []
@returnhash = { command: nil, plane: nil, airport: nil }

NUMBER_OF_PLANES = 20

def initialize_planes
  id = 0
  NUMBER_OF_PLANES.times do
    id += 1
    plane = Plane.new(id)
    plane.in_air = true
    @planeslist << plane
  end
end

def airportinclude?(number)
  num = 0
  airportshortlist = []
  @airportlist.each do |airport|
    num += 1
    airportshortlist << num
  end
  airportshortlist.include?(number)
end

def planeinclude?(number)
  num = 0
  planeshortlist = []
  @planeslist.each do |plane|
    planeshortlist << plane.id
  end
  planeshortlist.include?(number)
end

def airportreport
  listno = 0
  returnstring = ""
  @airportlist.each do |airport|
    listno += 1
    airport_capacity = airport.capacity.to_s
    airport_planes = airport.planes
    returnstring += "Airport" + listno.to_s + ": Capacity - " + airport_capacity + "\n"
    returnstring += "Planes landed:" + "\n"
    planelistno = 0
    planelist = ""
    airport.planes.each do |planes|
      planelist += "plane" + planelistno + " "
    end
    returnstring += "[" + planelist + "]\n\n"
  end
  returnstring
end

def skyreport
  planeno = 0
  skylist = ""
  @planeslist.each do |plane|
    planeno = plane.id
    if plane.in_air == true
      skylist += "plane" + planeno.to_s + "  "
    end
  end
  skylist += "\n"
end

def screenupdate
  system('clear')
  puts "Airport information:"
  puts "--------------------"
  puts ""
  puts airportreport

  puts "Aircraft currently in air:"
  puts "--------------------------"
  puts ""
  puts skyreport
  puts ""
  puts "enter a command"
  puts "[Eg: land plane1 airport1]"
  puts ""
end

def getcommand
  userinput = ""
  while true do
    while userinput == ""
      userinput = gets.chomp
    end
    if userinput == "exit"
      exit
    end
    userinput = userinput.downcase
    input_split = userinput.split(" ")
    break if checkcommand(input_split) == true
    userinput = ""
  end
  @returnhash[:command] = input_split[0]
  @returnhash[:plane] = input_split[1].split("")[5]
  @returnhash[:airport] = input_split[2].split("")[7]
  @returnhash
end

def checkcommand(input_split)
  errortype = []

  if input_split.count == 3
    errortype << "word 1" if input_split[0] != "land" && input_split[0] != "takeoff"
    errortype << "word 2" if input_split[1].split("")[0..4] != "plane".split("")[0..4]
    errortype << "word 3" if input_split[2].split("")[0..6] != "airport".split("")[0..6]
  else
    errortype << "command length"
  end

  errortype << "plane number" if planeinclude?(input_split[1].split("")[5]) != true
  errortype << "airport number" if airportinclude?(input_split[2].split("")[7]) != true

  puts "error on #{errortype}" if errortype.count >= 1
  return true if errortype.count == 0
end

def run
  initialize_planes
  screenupdate
  getcommand
end

run
