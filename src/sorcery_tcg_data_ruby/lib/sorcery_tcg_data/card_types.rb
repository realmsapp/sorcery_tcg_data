# frozen_string_literal: true

module SorceryTcgData
  module CardTypes
    class CardType
      include ValueSemantics.for_attributes {
        key String
        name String
        description String
      }

      def avatar? = key == "avatar"
      def site? = key == "site"
      def minion? = key == "minion"
      def magic? = key == "magic"
      def aura? = key == "aura"
      def relic? = key == "relic"
      def spellbook? = minion? || magic? || aura? || relic?
    end

    ALL = Lookup.load("card_types.yaml") { |item| CardType.new(**item) }.freeze

    def self.fetch(key, *args) = ALL.fetch(key, *args)
  end
end
