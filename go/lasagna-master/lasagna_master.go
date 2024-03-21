package lasagna

func PreparationTime(layers []string, avgTime int) int {
	if avgTime == 0 {
		avgTime = 2
	}
	return len(layers) * avgTime
}

func Quantities(layers []string) (noodles int, sauce float64) {
	for _, layer := range layers {
		switch layer {
		case "noodles":
			noodles += 50
		case "sauce":
			sauce += 0.2
		}
	}
	return noodles, sauce
}

func AddSecretIngredient(friend, own []string) {
	lastIngredient := friend[len(friend)-1]
	own[len(own)-1] = lastIngredient
}

func ScaleRecipe(amounts []float64, portions int) []float64 {
	amountsNeeded := make([]float64, len(amounts))
	for i, amount := range amounts {
		amountsNeeded[i] = amount * float64(portions) / 2
	}
	return amountsNeeded
}
