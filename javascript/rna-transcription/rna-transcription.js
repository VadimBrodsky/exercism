'use strict';

var DnaTranscriber = function() {
    this.rnaKey = {
        'g': 'c',
        'c': 'g',
        't': 'a',
        'a': 'u'
    };
};

DnaTranscriber.prototype.toRna = function(dna) {
    return dna.toLowerCase().split('').map(nucleotide => {
        return this.rnaKey[nucleotide];
    }).join('').toUpperCase();
};

module.exports = DnaTranscriber;
