package birdwatcher

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) (count int) {
	for i := 0; i < len(birdsPerDay); i++ {
		count += birdsPerDay[i]
	}
	return count
}

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) (count int) {
	for i := 7 * (week - 1); i < len(birdsPerDay) && i < 7*week; i++ {
		count += birdsPerDay[i]
	}
	return count
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
	for i := 0; i < len(birdsPerDay); i += 2 {
		birdsPerDay[i]++
	}
	return birdsPerDay
}
