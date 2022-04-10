# frozen_string_literal: true

module SorceryTcgData
  module CardTypes
    class CardType
      include ValueSemantics.for_attributes {
        key String
        name String
      }

      def avatar? = key == "avatar"
      def site? = key == "site"
      def minion? = key == "minion"
      def magic? = key == "magic"
      def aura? = key == "aura"
      def relic? = key == "relic"

      def spellbook? = minion? || magic? || aura? || relic?
    end
  end
end
