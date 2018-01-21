
require File.expand_path('../spec_helper', __FILE__)
Dir["./lib/*.rb"].each {|file| require File.expand_path('../../'+file, __FILE__)}

describe BankingCodeChallenge::InterBank do

  before :each do
    @bank1 = BankingCodeChallenge::Bank.new( "Bank1" )
    @bank2 = BankingCodeChallenge::Bank.new( "Bank2" )
    @account_1_1 = BankingCodeChallenge::Account.new(1111,@bank1,30000)
    @account_2_1 = BankingCodeChallenge::Account.new(2211,@bank2,2000)
    @interBank1 = BankingCodeChallenge::InterBank.new(@account_1_1, @account_2_1, 500)
    @interBank2 = BankingCodeChallenge::InterBank.new(@account_1_1, @account_2_1, 100000)
	end

  describe 'validations' do

		context '.initialize' do
			it '#InterBank' do
        expect(@interBank1).to be_an_instance_of(BankingCodeChallenge::InterBank)
			end
    end

    context '#InterBank' do
			it '.deliver' do
        expect{@interBank1.deliver}.to change{@interBank1.status}
			end

      it '.deliver fail' do
        @interBank2.deliver
        expect(@interBank2.status).to eq ('failed delivery')
			end

	  end

  end

end
