require 'colorize'
require 'intra_bank.rb'
require 'inter_bank.rb'

module BankingCodeChallenge

  class Agent

    def makeTransfer amount, senderAccount, beneficiaryAccount

      # Intra-bank transfers
      if beneficiaryAccount.bank == senderAccount.bank
        raise "ALERT! Not enough Money in sender account, try a smaller amount.".red if senderAccount.balance < amount
        raise "ALERT! Sender and beneficiary most be different.".red if senderAccount == beneficiaryAccount

        intra_bank = IntraBank.new(senderAccount, beneficiaryAccount, amount)
        intra_bank.deliver
        intra_bank.status

      # Inter-bank transfers
      else
        @inter_bank = InterBank.new(senderAccount, beneficiaryAccount, amount)

        raise "ALERT! Not enough Money in sender account, try a smaller amount.".red if senderAccount.balance < (amount + @inter_bank.commission)

        if amount > @inter_bank.limit
          # Split transfer to avoid exceeds limit
          splitTransfers = self.checkTotalCommissions @inter_bank

          status = self.handleSplitTransfers splitTransfers

        else

          status = self.deliver @inter_bank

        end

        status

      end
    end

    def checkTotalCommissions inter_bank

      counter = 0
      maxAmount = inter_bank.limit - inter_bank.commission
      accumulated = maxAmount

      while accumulated < inter_bank.amount
        accumulated = accumulated + maxAmount
        counter += 1
      end
      lastTransfer = inter_bank.amount - maxAmount*(counter)
      # cost = (maxAmount+@inter_bank.commission)*counter + lastTransfer + @inter_bank.commission
      totalCommissions = inter_bank.commission*(counter+1)

      if inter_bank.amount + totalCommissions <= inter_bank.senderAccount.balance
        {maxAmount: maxAmount, maxAmountTimes: counter, lastTransfer: lastTransfer}
      else
        raise "ALERT! Not enough Money in sender account, try a smaller amount.".red
      end

    end

    def handleSplitTransfers splitTransfers

      splitTransfer = InterBank.new(@inter_bank.senderAccount, @inter_bank.beneficiaryAccount, splitTransfers[:maxAmount])
      lastTransfer = InterBank.new(@inter_bank.senderAccount, @inter_bank.beneficiaryAccount, splitTransfers[:lastTransfer])

      (splitTransfers[:maxAmountTimes]).times do
        self.deliver splitTransfer
      end

      self.deliver lastTransfer

    end

    def deliver inter_bank

      inter_bank.deliver

      while inter_bank.status == 'failed delivery'
        inter_bank.deliver
      end

      inter_bank.status
    end

  end

end
