# frozen_string_literal: true

module SorceryTcgData
  module Rarities
    class Rarity
      include ValueSemantics.for_attributes {
        key String
        name String
      }

      def ordinary? = key == "ordinary"
      def exceptional? = key == "exceptional"
      def elite? = key == "elite"
      def unique? = key == "unique"
    end

    ALL = Lookup.load("rarities.yaml") { |item| Rarity.new(**item) }.freeze

    def self.fetch(key, *args) = ALL.fetch(key, *args)
  end
end
