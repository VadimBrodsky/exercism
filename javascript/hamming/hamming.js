"use strict";

var Hamming = function() {};

Hamming.prototype.compute = function(dna1, dna2) {
    if (dna1.length !== dna2.length) {
        throw new Error('DNA strands must be of equal length.');
    } else {
        return dna1.split('').filter((part, i) => part !== dna2[i]).length;
    }
};

module.exports = Hamming;
