require 'transfer.rb'

module BankingCodeChallenge

  class IntraBank < Transfer

    attr_reader :senderAccount, :beneficiaryAccount, :amount, :status

    def initialize senderAccount, beneficiaryAccount, amount
      super(senderAccount, beneficiaryAccount, amount)
      @status = 'pending'
    end

    def deliver
      begin
      raise unless self.senderAccount.balance >= self.amount
        self.senderAccount.takeOutMoney(self.amount)
        self.beneficiaryAccount.depositMoney(self.amount)
        @status = 'successfully delivered'
      rescue
        @status = 'failed delivery'
        raise "Alert! something went wrong with deliver"
      end
    end

  end

end
