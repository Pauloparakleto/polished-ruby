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
          define_method(:user_name) { 'user name' }
          define_method(:admin_name) { 'admin name' }
          define_method(:customer_name) { 'customer name' }
        end
      end
    end
  end
end
