class Person < ActiveRecord::Base
  has_many :addresses
  accepts_nested_attributes_for :addresses

  def person_name
    self.try(:person).try(:name)
  end

  def person_name=(name)
     self.person = Person.find_or_create_by(name: name)
     self.person = person
  end
end
