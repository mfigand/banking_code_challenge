
require File.expand_path('../spec_helper', __FILE__)
Dir["./lib/*.rb"].each {|file| require File.expand_path('../../'+file, __FILE__)}

describe BankingCodeChallenge::IntraBank do

  before :each do
    @bank1 = BankingCodeChallenge::Bank.new( "Bank1" )
    @account_1_1 = BankingCodeChallenge::Account.new(1111,@bank1,30000)
    @account_1_2 = BankingCodeChallenge::Account.new(1122,@bank1,2000)
    @intraBank1 = BankingCodeChallenge::IntraBank.new(@account_1_1, @account_1_2, 500)
    @intraBank2 = BankingCodeChallenge::IntraBank.new(@account_1_1, @account_1_2, 100000)
	end

  describe 'validations' do

		context '.initialize' do
			it '#intraBank' do
        expect(@intraBank1).to be_an_instance_of(BankingCodeChallenge::IntraBank)
			end
    end

    context '#intraBank' do
			it '.deliver successfully' do
        expect{@intraBank1.deliver}.to change{@intraBank1.status}
			end

      it '.deliver fail' do
        expect{@intraBank2.deliver}.to raise_error(RuntimeError)
			end

	  end

  end

end
