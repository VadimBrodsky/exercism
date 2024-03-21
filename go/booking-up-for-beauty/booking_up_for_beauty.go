package booking

import "time"

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	layout := "1/02/2006 15:04:05"
	t, err := time.Parse(layout, date)

	if err != nil {
		panic("cannot parse the scheduled date " + date)
	}

	return t
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	layout := "January 2, 2006 15:04:05"
	appointment, err := time.Parse(layout, date)

	if err != nil {
		panic("cannot parse the scheduled date " + date)
	}

	c := appointment.Compare(time.Now())
	return c == -1
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	layout := "Monday, January 2, 2006 15:04:05"
	appointment, err := time.Parse(layout, date)

	if err != nil {
		panic("cannot parse the scheduled date " + date)
	}

	return appointment.Hour() >= 12 && appointment.Hour() < 18
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	layout := "1/2/2006 15:04:05"
	appointment, err := time.Parse(layout, date)

	if err != nil {
		panic("cannot parse the scheduled date " + date)
	}

	return appointment.Format("You have an appointment on Monday, January 2, 2006, at 15:04.")
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	return time.Date(time.Now().Year(), time.September, 15, 0, 0, 0, 0, time.UTC)
}
