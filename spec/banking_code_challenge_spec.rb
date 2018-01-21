
require File.expand_path('../spec_helper', __FILE__)
Dir["./lib/*.rb"].each {|file| require File.expand_path('../../'+file, __FILE__)}

describe BankingCodeChallenge do

  before :each do
		@bank1 = BankingCodeChallenge::Bank.new( "Bank1" )
    @bank2 = BankingCodeChallenge::Bank.new( "Bank2" )
    @account_1_1 = BankingCodeChallenge::Account.new(1111,@bank1,30000)
    @account_1_2 = BankingCodeChallenge::Account.new(1122,@bank1,2000)
    @account_2_1 = BankingCodeChallenge::Account.new(1111,@bank2,3000)
    @account_2_2 = BankingCodeChallenge::Account.new(1122,@bank2,4000)
    @transfer1 = BankingCodeChallenge::Transfer.new(@account_1_1, @account_1_2, 500)
    @intraBank = BankingCodeChallenge::IntraBank.new(@account_1_1, @account_1_2, 500)
    @interBank = BankingCodeChallenge::InterBank.new(@account_1_1, @account_2_1, 500)
    @agent = BankingCodeChallenge::Agent.new()
	end

  describe 'validations' do
    # Create the models and their relationships to accurately reflect banks, accounts and transfers.
		context '.initialize' do
			it 'Create bank' do
        expect(@bank1).to be_an_instance_of(BankingCodeChallenge::Bank)
			end
		end

    context '.initialize' do
			it 'Create account' do
        expect(@account_1_1).to be_an_instance_of(BankingCodeChallenge::Account)
			end
		end

    context '.initialize' do
			it 'Create transfer' do
        expect(@transfer1).to be_an_instance_of(BankingCodeChallenge::Transfer)
			end

      # Create the different types of transfers for intra-bank and inter-bank transfers.
      it 'Create Intra-bank' do
        expect(@intraBank).to be_an_instance_of(BankingCodeChallenge::IntraBank)
			end

      it 'Create Inter-bank' do
        expect(@interBank).to be_an_instance_of(BankingCodeChallenge::InterBank)
			end

      # Make sure that new types of accounts and transfers can be added to the bank with minimal effort.
      # Notice that you can change transfer values(commission, limit and failure) to Create new type of transfers
      it 'Creates new types of transfers' do
        @newTransferType = BankingCodeChallenge::InterBank.new(@account_1_1, @account_2_1, 500, commission = 10, limit = 2000, failure = 10)
        expect(@newTransferType).to be_an_instance_of(BankingCodeChallenge::InterBank)
      end

      # Jim has an account on the bank A and Emma has an account on the bank B.
      # Jimowes Emma 20000€. Emma is already a bit angry, because she did not get the money although Jim told her that he already sent it.
      # Help Jim send his money by developing a transfer​ ​agent​.
      it 'Creates Agent' do
        expect(@agent).to be_an_instance_of(BankingCodeChallenge::Agent)
      end
		end

	end

  describe 'Bank' do
    # Create the models and their relationships to accurately reflect banks, accounts and transfers.
    context 'bank system' do
      it 'Create bank1' do
        expect(@bank1).to be_an_instance_of(BankingCodeChallenge::Bank)
			end

      it "list bank1's accounts" do
        @bank1.addAccount(@account_1_1)
        @bank1.addAccount(@account_1_2)
        expect(@bank1.accounts.count).to be >= 2
			end

      it 'Create bank2' do
        expect(@bank2).to be_an_instance_of(BankingCodeChallenge::Bank)
			end

      it "list bank2's accounts" do
        @bank2.addAccount(@account_2_1)
        @bank2.addAccount(@account_2_2)
        expect(@bank2.accounts.count).to be >= 2
			end

    end
  end

  describe 'Transfers' do

    context 'intra-bank' do
      it "make transfer" do
        expect{@intraBank.deliver}.to change{@intraBank.status}
      end
    end

    context 'intra-bank' do
      it "discount amount from senderAccount" do
        expect{@intraBank.deliver}.to change{@intraBank.senderAccount.balance}.by(-@intraBank.amount)
      end
    end

    context 'intra-bank' do
      it "add amount to beneficiaryAccount" do
        expect{@intraBank.deliver}.to change{@intraBank.beneficiaryAccount.balance}.by(@intraBank.amount)
      end
    end

    context 'inter-bank' do
      it "make transfer" do
        expect{@interBank.deliver}.to change{@interBank.status}
      end
    end

  end

  describe 'Account' do

    context '.takeOutMoney' do
      it "discount amount" do
        expect{@account_1_1.takeOutMoney(100)}.to change{@account_1_1.balance}.by(-100)
      end
    end

    context '.depositMoney' do
      it "add amount" do
        expect{@account_1_1.depositMoney(100)}.to change{@account_1_1.balance}.by(100)
      end
    end

  end

  describe 'Agent' do
    # Jim has an account on the bank A and Emma has an account on the bank B. Jim owes Emma 20000€.
    # The agent assures that everybody gets their money.
    context '.transfer' do
      it "successfully" do
        status = @agent.makeTransfer(20000,@account_1_1,@account_2_1)
        expect(status).to eq ('successfully delivered')
      end
    end
  end

  describe 'Records' do
    context 'all transfer' do
      # Banks store the history of transfers.
      it '.addTransfer' do
        transfer = BankingCodeChallenge::Transfer.new(@account_1_1, @account_1_2, 100)
        expect(@bank1.transfers).to include(transfer)
      end
    end
  end


end
