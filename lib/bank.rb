require "pry"
module BankingCodeChallenge

  class Bank

    attr_reader :name, :accounts, :transfers

    def initialize name
      @name = name
      @accounts = []
      @transfers = []
    end

    def addAccount account
      if @accounts.include?(account)
        raise "ALERT! account number already exist in database, try different number.".red
      else
        @accounts << account
      end
    end

    def addTransfer transfer
      @transfers << transfer
    end

  end


end
