require_relative 'docking_station'

class Van

  attr_reader :bikes_storage

  def initialize
    @bikes_storage = [];
  end

  def receive_broken_bikes(bikes)
    bikes.map{|bike| bikes_storage << bike}
  end

  def deliver_bikes_to= (destination)
    bikes_storage.map{|bike|
      destination.dock(bikes_storage.delete(bike))
    }
  end


end
