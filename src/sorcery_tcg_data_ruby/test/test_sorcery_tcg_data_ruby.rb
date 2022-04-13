# frozen_string_literal: true

require_relative "test_helper"

class TestSorceryTcgDataRuby < Minitest::Test
  def test_it_does_something_useful
    card = SorceryTcgData::Cards.fetch("accursed_albatross")

    assert_equal "accursed_albatross", card.identifier
    assert_equal "exceptional", card.rarity.key
    assert "exceptional", card.rarity.exceptional?
    assert_equal ["water"], card.elements.map(&:key)
    assert_equal "minion", card.card_type.key
    assert_equal "vincent_pompetti", card.artist.key
    assert_equal ["airborne"], card.keywords.map(&:key)
  end
end
