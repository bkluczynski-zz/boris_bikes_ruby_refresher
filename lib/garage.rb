require 'bike_container'


class Garage < BikeContainer

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

end
