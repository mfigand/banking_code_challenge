
require File.expand_path('../spec_helper', __FILE__)
Dir["./lib/*.rb"].each {|file| require File.expand_path('../../'+file, __FILE__)}

describe BankingCodeChallenge::Account do

  before :each do
		@bank1 = BankingCodeChallenge::Bank.new( "Bank1" )
    @account_1_1 = BankingCodeChallenge::Account.new(1111,@bank1,10000)
	end

  describe 'validations' do

		context '.initialize' do
			it '#account' do
        expect(@account_1_1).to be_an_instance_of(BankingCodeChallenge::Account)
			end
    end

    context '#account' do
			it '.depositMoney' do
        expect{@account_1_1.depositMoney(1000)}.to change{@account_1_1.balance}.by(1000)
			end

      it '.takeOutMoney' do
        expect{@account_1_1.takeOutMoney(1000)}.to change{@account_1_1.balance}.by(-1000)
			end

	  end

  end

end
