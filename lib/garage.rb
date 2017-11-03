require_relative 'storing_facility'

class Garage < StoringFacility

  attr_reader :bikes

  def initialize
    super()
  end

  def repair_bikes
    bikes.map!{ |bike| repair(bike) }
  end

  def repair(bike)
    bike.repair
    bike
  end

  def dock(bike)
    bikes.push(bike)
  end



end
