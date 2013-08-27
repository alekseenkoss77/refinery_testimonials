module Refinery
  module Testimonials
    class Testimonial < Refinery::Core::BaseModel
      self.table_name = 'refinery_testimonials'

      attr_accessible :name, :email, :message, :position

      acts_as_indexed :fields => [:name, :email, :message]

      validates :name, :presence => true
      validates :message, :presence => true
    end
  end
end
