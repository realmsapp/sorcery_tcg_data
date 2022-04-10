# frozen_string_literal: true

module SorceryTcgData
  module Rarities
    class Rarity
      include ValueSemantics.for_attributes {
        key String
        name String
      }
    end
  end
end
