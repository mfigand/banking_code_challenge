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
      self.beneficiaryAccount.bank.addTransfer(self) if self.senderAccount.bank != self.beneficiaryAccount.bank
    end

  end

end
