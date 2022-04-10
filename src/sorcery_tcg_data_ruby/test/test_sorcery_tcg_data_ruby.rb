# frozen_string_literal: true

require_relative "test_helper"

class TestSorceryTcgDataRuby < Minitest::Test
  def test_it_does_something_useful
    card = SorceryTcgData::Cards.fetch("abundance")

    assert_equal "abundance", card.identifier
    assert_equal "elite", card.rarity.key
    assert_equal "water", card.element.key
    assert_equal "aura", card.card_type.key
    assert_equal "vincent_pompetti", card.artist.key
  end
end
