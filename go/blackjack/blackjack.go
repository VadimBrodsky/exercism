package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	switch card {
	case "ace":
		return 11
	case "king", "queen", "jack", "ten":
		return 10
	case "nine":
		return 9
	case "eight":
		return 8
	case "seven":
		return 7
	case "six":
		return 6
	case "five":
		return 5
	case "four":
		return 4
	case "three":
		return 3
	case "two":
		return 2
	case "one":
		return 1
	default:
		return 0
	}
}

const (
	Stand = "S"
	Hit   = "H"
	Split = "P"
	Win   = "W"
)

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	c1 := ParseCard(card1)
	c2 := ParseCard(card2)
	d := ParseCard(dealerCard)

	switch {
	// If you have a pair of aces you must always split them
	case c1 == c2 && c1 == 11:
		return Split

	// If you have a Blackjack  and the dealer does not have an ace, a figure or a ten then you automatically win
	case (c1+c2 == 21) && d < 10:
		return Win

	// If the dealer does have any of those cards then you'll have to stand
	case (c1+c2 == 21) && d >= 10:
		return Stand

	// If your cards sum up to a value within the range [17, 20] you should always stand.
	case (c1+c2) >= 17 && (c1+c2) <= 20:
		return Stand

	// If your cards sum up to a value within the range [12, 16]
	case (c1+c2) >= 12 && (c1+c2) <= 16 && d < 7:
		return Stand

	// you should always stand unless the dealer has a 7 or higher, in which case you should always hit
	case (c1+c2) >= 12 && (c1+c2) < 16 && d >= 7:
		return Hit

	// If your cards sum up to 11 or lower you should always hit.
	case (c1 + c2) <= 11:
		return Hit

	default:
		return Hit
	}
}
