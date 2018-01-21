banking_code_challenge
======================

Install
-------

* First execute 'bundle install' to install gems

* Run 'rake' to execute features in show_me_the_money.rb file.

* Run 'rake rspec' to run all tests.


Description
-----------

About​ ​This​ ​Test
The purpose of this code test is to show us your skills in:
• Object Oriented Programming
• TDD
• Clean code
• Git
• Problem solving
Please keep these aspects in mind as you develop your solution. Also, your
chosen implementation doesn't necessarily have to be the best you can think of,
but one that you can implement in the allocated time.

Instructions
• Create a project which models the situation below.
• The language used should be Ruby​ (unless previously agreed otherwise).
• All code should be tested following TDD​.
• A README​ file must be attached explaining your implementation.
• Create a .zip with your code​ and git​ directory.
• Answer our email with the zip​ of the project.

Background
The software you write in this test will be used for banks. Banks have accounts.
Accounts hold money. Transfers can be made between accounts. Banks store the
history of transfers.
There can be two types of transfers:
• Intra-bank​ transfers, between accounts of the same bank. They don't
have commissions, they don't have limits and they always succeed.
• Inter-bank​ transfers, between accounts of different banks. They have 5€
commissions, they have a limit of 1000€ per transfer. And they have a 30%
chance of failure.


Features
--------

Part​ ​1
Create the models and their relationships to accurately reflect banks, accounts
and transfers. Make sure that new types of accounts and transfers can be added
to the bank with minimal effort.

Part​ ​2
After modeling the domain(part 1), create a file called
show_me_the_money.rb*​ in charge of reproducing the next situation:
Jim has an account on the bank A and Emma has an account on the bank B. Jim
owes Emma 20000€. Emma is already a bit angry, because she did not get the
money although Jim told her that he already sent it.
Help Jim send his money by developing a transfer​ ​agent​. This agent assures
that everybody gets their money. When the agent receives an order to transfer
money from account A to account B, he issues transfers considering commissions,
transfer limits and possibility of transfer failures.

The execution of the script will print the balance of every account before and after
the transfers and the history of the transfer of every bank.

Questions:
--------

Please also supply your answer to the following questions:

• How would you improve your solution?

- If i'll know all the characteristics and purposes of the project maybe i would change parts of the models, adding a model for holders accounts.

- Also i think i could have added more security to transfers, like add a password to accounts or something to make sure the account's holder previously approved transfer.

- Also i could handle more accurate the part of making fail the 30% of Transfers randomly, i think it would be better if it depended on something more clear.

• How would you adapt your solution if transfers are not instantaneous?

- Using Callbacks inside my Processes or a solution to handle the queuing system, like Sidekiq. This prevents the user from waiting and allows to control transfers errors to avoid unwanted deliveries.

Requirements
------------

* ruby-2.2


Author
------

Original author: Manuel Figueroa Andrade


License
-------

(The MIT License) FIXME (different license?)

Copyright (c) 2018 FIXME (author's name)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
