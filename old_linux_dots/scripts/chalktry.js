const chalkAnimation = require('chalk-animation');
 
const glitch = chalkAnimation.glitch('Welcome My Son. Welcome To The Machine');
setTimeout(() => {
    // Stop the 'Lorem ipsum' animation, then write on a new line.
    console.log('');
}, 2500);
glitch.frame()
