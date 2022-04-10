# frozen_string_literal: true

require_relative "test_helper"

class TestSorceryTcgDataRuby < Minitest::Test
  def test_it_does_something_useful
    card = SorceryTcgData::Lookup.card("abundance")
    assert "abundance", card.identifier
  end
end
