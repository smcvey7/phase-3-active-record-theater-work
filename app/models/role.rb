class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.select do |audition|
      audition.actor
    end
  end

  def locations
    self.auditions.select do |audition|
      audition.location
    end
  end

  def lead
    hired_actor = self.auditions.find_by("hired = true")
    if hired_actor
      hired_actor
    else
      return "no actor has been hired for this role"
  end

end