require_relative 'docking_station'

class Van

  attr_reader :bikes_storage, :garage

  def initialize(garage = Garage.new)
    @bikes_storage = [];
    @garage = garage
  end

  def receive_broken_bikes(bikes)
    bikes.map{|bike| bikes_storage << bike}
  end

  def deliver_bikes
    bikes_storage.map{|bike|
      garage.bikes << bikes_storage.delete(bike)
    }
  end



end
