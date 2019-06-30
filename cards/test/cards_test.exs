defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "deal leaves the right amount of cards" do
    deck = Cards.create_deck
    {hand, deck} = Cards.deal(deck, 18)
    hand_length = length(hand)
    assert hand_length == 18
    rem_deck_length = length(deck)
    assert rem_deck_length == 2
    [r1, r2] = deck
    assert r1 == "Four of Diamonds"
    assert r2 == "Five of Diamonds"
  end
end
