require_relative 'docking_station'
require 'bike_container'

class Van < BikeContainer

  def initialize
    super()
  end

  def receive_broken_bikes(bikes_to_receive)
    bikes_to_receive.map{|bike| add(bike)}
  end

  def deliver_bikes_to= (destination)
    bikes.map{|bike|
      destination.add(remove_bike(bike))
    }
  end


end
