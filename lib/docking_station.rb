require_relative 'bike'

class DockingStation

attr_reader :bike

def release_bike
  fail "Sorry, there are no bikes available for hire" unless @bike
  @bike
end

def dock(bike)
  @bike = bike
end



end
