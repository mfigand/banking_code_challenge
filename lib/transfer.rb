require "pry"
module BankingCodeChallenge

  class Transfer

    attr_reader :senderAccount, :beneficiaryAccount, :amount, :status

    def initialize senderAccount, beneficiaryAccount, amount
      @senderAccount = senderAccount
      @beneficiaryAccount = beneficiaryAccount
      @amount = amount
      @status = 'pending'
      # Banks store the history of transfers.
      self.senderAccount.bank.addTransfer(self)
      self.beneficiaryAccount.bank.addTransfer(self)
    end

  end

end
