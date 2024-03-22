package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	return map[string]int{
		"quarter_of_a_dozen": 3,
		"half_of_a_dozen":    6,
		"dozen":              12,
		"small_gross":        120,
		"gross":              144,
		"great_gross":        1728,
	}
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return map[string]int{}
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	_, hasUnit := units[unit]
	if !hasUnit {
		return false
	}

	_, hasItem := bill[item]
	if !hasItem {
		bill[item] = units[unit]
	} else {
		bill[item] += units[unit]
	}

	return true
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	_, hasUnit := units[unit]
	_, hasItem := bill[item]
	if !hasItem || !hasUnit {
		return false
	}

	newUnit := bill[item] - units[unit]
	if newUnit < 0 {
		return false
	} else if newUnit == 0 {
		delete(bill, item)
	} else {
		bill[item] = newUnit
	}

	return true
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	i, hasItem := bill[item]
	if !hasItem {
		return 0, false
	}

	return i, true
}
