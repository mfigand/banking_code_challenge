
require File.expand_path('../spec_helper', __FILE__)
Dir["./lib/*.rb"].each {|file| require File.expand_path('../../'+file, __FILE__)}

describe BankingCodeChallenge::Bank do

  before :each do
		@bank1 = BankingCodeChallenge::Bank.new( "Bank1" )
    @account_1_1 = BankingCodeChallenge::Account.new(1111,@bank1,1000)
    @account_1_2 = BankingCodeChallenge::Account.new(1122,@bank1,2000)
    @transfer1 = BankingCodeChallenge::Transfer.new(@account_1_1, @account_1_2, 500)
    @bank2 = BankingCodeChallenge::Bank.new( "Bank2" )

	end

  describe 'validations' do

		context '.initialize' do
			it '#bank' do
        expect(@bank1).to be_an_instance_of(BankingCodeChallenge::Bank)
			end
    end

    context '.addAccount' do
			it 'successfully' do
        @bank1.addAccount(@account_1_2)
        expect(@bank1.accounts).to include(@account_1_2)
			end

      it 'with repeated number' do
        @bank1.addAccount(@account_1_2)
        expect{@bank1.addAccount(@account_1_2)}.to raise_error(RuntimeError)
			end

	  end

  end

end
