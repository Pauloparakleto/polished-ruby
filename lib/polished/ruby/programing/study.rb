# frozen_string_literal: true

require_relative "study/version"

module Polished
  module Ruby
    module Programing
      module Study
        class Error < StandardError; end
        # Your code goes here...

        class A
          ENTITIES = [:user, :customer, :admin]

          ENTITIES.each {|entity| define_method(:"#{entity}_name") { "#{entity} name" }}
        end
      end
    end
  end
end
