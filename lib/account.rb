module  BankingCodeChallenge

  class Account

    attr_reader :number, :bank, :balance, :holder

    def initialize number, bank, balance, holder="anonymous"
      @number = number
      @bank = bank
      @balance = balance
      @holder = holder
    end

    def depositMoney amount
      @balance += amount
    end

    def takeOutMoney amount
      @balance -= amount
    end

  end

end
