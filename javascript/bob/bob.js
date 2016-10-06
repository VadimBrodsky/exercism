//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {
    this.responses = {
        'normal': 'Whatever.',
        'question': 'Sure.',
        'yell': 'Whoa, chill out!'
    };
};

Bob.prototype.hey = function(input) {
    switch (input[input.length - 1]) {
    case '!':
        return this.responses.yell;
    case '?':
        return this.responses.question;
    default:
        return this.responses.normal;
    }
};

module.exports = Bob;
