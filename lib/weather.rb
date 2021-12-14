class Weather # weather needs its own class to satisfy SRP i.e. so Airport isn't responsible for it
  def stormy? 
    rand(5) == 4 # as it's stormy in rare cases, stormy? will only return true if rand(5) generates 
  end              # 4 i.e. probability 4 in 5. 
end
