# frozen_string_literal: true

module SorceryTcgData
  module Elements
    class Element
      include ValueSemantics.for_attributes {
        key
        name
      }
    end
  end
end
