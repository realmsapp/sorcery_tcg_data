module SorceryTcgData
  module Artists
    class Artist
      include ValueSemantics.for_attributes {
        key String
        name String
      }
    end
  end
end