"use strict";

// maker of divisible functions
function divisible(factor) {
    return function(number) {
        return number % factor === 0;
    };
}

var LeapYear = function(year) {
    this.year = year;
};

LeapYear.prototype.isLeap = function() {
    var divisibleBy4   = divisible(4)(this.year),
        divisibleBy100 = divisible(100)(this.year),
        divisibleBy400 = divisible(400)(this.year);

    return (divisibleBy4 && (!divisibleBy100 || divisibleBy400));
};

module.exports = LeapYear;
