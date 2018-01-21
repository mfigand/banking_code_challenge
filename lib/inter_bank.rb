require 'transfer.rb'

module BankingCodeChallenge

  class InterBank < Transfer

    attr_reader :senderAccount, :beneficiaryAccount, :amount, :commission, :limit, :failure, :status

    def initialize senderAccount, beneficiaryAccount, amount, commission = 5, limit = 1000, failure = 30
      super(senderAccount, beneficiaryAccount, amount)
      @commission = commission
      @limit = limit
      @failure = failure
      @status = 'pending'
    end

    def deliver

      if self.senderAccount.balance < self.amount || Random.rand(1..10) <= 3
        @status = 'failed delivery'
      else
        self.senderAccount.takeOutMoney(self.amount+self.commission)
        self.beneficiaryAccount.depositMoney(self.amount)
        @status = 'successfully delivered'
      end

    end

    def updateAmount amount
      @amount = amount
    end

  end

end
