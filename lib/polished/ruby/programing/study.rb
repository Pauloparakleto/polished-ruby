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

        class InMemoryDatabase
          attr_accessor :albun_artists, :albun_track_artists

          def initialize
            @albun_infos =  100.times.flat_map do |i|
              10.times.map do |j|
                ["Album #{i}", j, "Artist #{j}"]
              end
            end
            @albun_artists = Set.new(@albun_infos.flat_map(&:last))
            @albun_track_artists = {}
          end

          # array intersection 
          # lambda examples

          def search(artist)
            lookup = ->(artist) do
              albun_artists && artist
            end
            lookup.call(artist)
          end
        end
      end
    end
  end
end
