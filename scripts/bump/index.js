/**********************************
 * BUMP VERSION THEN RUN CHANGELOG
 **********************************/
require('coffeescript/register');
require('../helpers/add-colors')();
require(`${__dirname}/bump`)();