
require File.expand_path('../spec_helper', __FILE__)
Dir["./lib/*.rb"].each {|file| require File.expand_path('../../'+file, __FILE__)}

describe BankingCodeChallenge::Transfer do

  before :each do
    @bank1 = BankingCodeChallenge::Bank.new( "Bank1" )
    @account_1_1 = BankingCodeChallenge::Account.new(1111,@bank1,30000)
    @account_1_2 = BankingCodeChallenge::Account.new(1122,@bank1,2000)
    @transfer1 = BankingCodeChallenge::Transfer.new(@account_1_1, @account_1_2, 500)
	end

  describe 'validations' do

		context '.initialize' do
			it '#transfer' do
        expect(@transfer1).to be_an_instance_of(BankingCodeChallenge::Transfer)
			end
    end

  end

end
