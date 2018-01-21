require 'rspec'
require 'pry'
require 'colorize'


puts "\nBANKING CODE CHALLENGE".yellow
puts "XXXXXXXXXXXXXXXXXXXXXX".yellow

puts "\nPART 1".magenta
puts "\nCreate the models and their relationships to accurately reflect banks, accounts and transfers.".green

bank1 = BankingCodeChallenge::Bank.new("Bank1")
account_1_1 = BankingCodeChallenge::Account.new(1111,bank1,50500, "Jim")
account_1_2 = BankingCodeChallenge::Account.new(1122,bank1,2000)
bank1.addAccount(account_1_1)
bank1.addAccount(account_1_2)

puts "\nFirst bank name: " + bank1.name
puts "\nFirst bank accounts: "
bank1.accounts.map{|a|
  puts "account number: " + a.number.to_s + " balance: €" + a.balance.to_s
}

bank2 = BankingCodeChallenge::Bank.new("Bank2")
account_2_1 = BankingCodeChallenge::Account.new(2211,bank2,3000, "Emma")
account_2_2 = BankingCodeChallenge::Account.new(2222,bank2,4000)
bank2.addAccount(account_2_1)
bank2.addAccount(account_2_2)

puts "\nSecond bank name: " + bank2.name
puts "\nSecond bank accounts: "
bank2.accounts.map{|a|
  puts "account number: " + a.number.to_s + " balance: €" + a.balance.to_s
}

puts "\nTransfer €500 by INTRA-BANK transfer".green
puts "\nBEFORE transfer".green
puts bank1.name
puts "account number: " + account_1_1.number.to_s + " balance: €" + account_1_1.balance.to_s
puts "account number: " + account_1_2.number.to_s + " balance: €" + account_1_2.balance.to_s
puts "history of the transfers: " + bank1.transfers.count.to_s

intraBank = BankingCodeChallenge::IntraBank.new(account_1_1, account_1_2, 500)
intraBank.deliver
puts "\nTransfering...".cyan

puts "\nAFTER transfer".green
puts bank1.name
puts "Transfer status: " + intraBank.status
puts "account number: " + account_1_1.number.to_s + " balance: €" + account_1_1.balance.to_s
puts "account number: " + account_1_2.number.to_s + " balance: €" + account_1_2.balance.to_s
puts "history of the transfers: " + bank1.transfers.count.to_s


puts "\nTransfer €500 by INTER-BANK transfer".green
puts "\nBEFORE transfer".green
puts bank1.name
puts "account number: " + account_1_1.number.to_s + " balance: €" + account_1_1.balance.to_s
puts "history of the transfers: " + bank1.transfers.count.to_s

puts bank2.name
puts "account number: " + account_2_1.number.to_s + " balance: €" + account_2_1.balance.to_s
puts "history of the transfers: " + bank2.transfers.count.to_s


interBank = BankingCodeChallenge::InterBank.new(account_1_1, account_2_1, 500)
interBank.deliver
puts "\nTransfering...".cyan

puts "\nAFTER transfer".green
if interBank.status == "failed delivery"
  puts "Transfer status: Transfer failed by 30% chance of failure."
else
  puts "Transfer status: " + interBank.status
end
puts bank1.name
puts "account number: " + account_1_1.number.to_s + " balance: €" + account_1_1.balance.to_s
puts "history of the transfers: " + bank1.transfers.count.to_s
puts bank2.name
puts "account number: " + account_2_1.number.to_s + " balance: €" + account_2_1.balance.to_s
puts "history of the transfers: " + bank2.transfers.count.to_s



puts "\nPART 2".magenta

puts "\nJim has an account on the bank A and Emma has an account on the bank B."
puts "Jim owes Emma 20000€. Emma is already a bit angry, because she did not get the money although Jim told her that he already sent it."
puts "Help Jim send his money by developing a transfer​ ​agent​."

agent = BankingCodeChallenge::Agent.new()

puts "This agent assures that everybody gets their money."
puts "When the agent receives an order to transfer money from account A to account B,"
puts "he issues transfers considering commissions,transfer limits and possibility of transfer failures."


puts "\nTransfer €2000 by an Agent".green
puts "\nBEFORE transfer"
puts bank1.name
puts account_1_1.holder + "´s account balance: €" + account_1_1.balance.to_s
puts "history of the transfers: " + bank1.transfers.count.to_s
puts bank2.name
puts account_2_1.holder + "´s account balance: €"  + account_2_1.balance.to_s
puts "history of the transfers: " + bank2.transfers.count.to_s

status = agent.makeTransfer(20000,account_1_1,account_2_1)

puts "\nTransfering...".cyan

puts "\nAFTER transfer"
puts "Transfer status: " + status
puts bank1.name
puts account_1_1.holder + "´s account balance: €" + account_1_1.balance.to_s
puts "history of the transfers: " + bank1.transfers.count.to_s
puts bank2.name
puts account_2_1.holder + "´s account balance: €" + account_2_1.balance.to_s
puts "history of the transfers: " + bank2.transfers.count.to_s
