# frozen_string_literal: true

require "date"

module SorceryTcgData
  module Releases
    class Release
      include ValueSemantics.for_attributes {
        key
        name
        release_date
        notes
      }
    end
  end
end
