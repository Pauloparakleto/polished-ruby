# frozen_string_literal: true

require_relative "study/version"

module Polished
  module Ruby
    module Programing
      module Study
        class Error < StandardError; end
        # Understunding how symbols differ from strings
        # I needed to understund at once how to use Module#define_method
        # In order to not repeat code lines.
        # Imagine if we have one hundred entities,
        # On this way, we need just to add it to the entities array.
        # No need to add another method. 
        class A
          ENTITIES = [:user, :customer, :admin]

          ENTITIES.each {|entity| define_method(:"#{entity}_name") { "#{entity} name" }}

          define_method(:set_customer_name){|name| @customer_name = name }
          define_method(:welcome){|name| 'Welcome, ' + name + '!'}
        end
      end
    end
  end
end
