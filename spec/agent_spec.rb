
require File.expand_path('../spec_helper', __FILE__)
Dir["./lib/*.rb"].each {|file| require File.expand_path('../../'+file, __FILE__)}

describe BankingCodeChallenge::Agent do

  before :each do
    @bank1 = BankingCodeChallenge::Bank.new( "Bank1" )
    @bank2 = BankingCodeChallenge::Bank.new( "Bank2" )
    @account_1_1 = BankingCodeChallenge::Account.new(1111,@bank1,100000)
    @account_2_1 = BankingCodeChallenge::Account.new(1111,@bank2,3000)
    @inter_bank_1 = BankingCodeChallenge::InterBank.new(@account_1_1, @account_2_1, 100)
    @inter_bank_2 = BankingCodeChallenge::InterBank.new(@account_1_1, @account_2_1, 100000)
    @agent = BankingCodeChallenge::Agent.new()

	end

  describe 'validations' do

		context '.initialize' do
			it '#agent' do
        expect(@agent).to be_an_instance_of(BankingCodeChallenge::Agent)
			end
    end

    context '#agent' do
			it '.makeTransfer successfully' do
        expect{@agent.makeTransfer(20000,@account_1_1,@account_2_1)}.to change{@account_1_1.balance}.by(-20105)
        expect{@agent.makeTransfer(20000,@account_1_1,@account_2_1)}.to change{@account_2_1.balance}.by(20000)
        expect(@agent.makeTransfer(20000,@account_1_1,@account_2_1)).to eq ('successfully delivered')
			end

      it '.makeTransfer fail' do
        expect{@agent.makeTransfer(200000,@account_1_1,@account_2_1)}.to raise_error(RuntimeError)
			end

      it '.checkTotalCommissions successfully' do
        expect(@agent.checkTotalCommissions @inter_bank_1).to have_key(:maxAmount)
			end

      it '.checkTotalCommissions fail' do
        expect{@agent.checkTotalCommissions @inter_bank_2}.to raise_error(RuntimeError)
			end

      it '.deliver' do
        expect(@agent.deliver(@inter_bank_1)).to eq ('successfully delivered')
      end

	  end

  end

end
