require 'pry'
require "rspec"
require './lib/bank_account'

describe BankAccount do
  it 'exists' do
    checking = BankAccount.new(123, '0987', 250.0)

    expect(checking).to be_an BankAccount
  end

  it 'has attributes' do
    checking = BankAccount.new(123, '0987', 250.0)

    expect(checking.account_number).to eq 123
    expect(checking.secret_pin).to eq '0987'
    expect(checking.balance).to eq 250.0
  end

  it 'can deposit money' do
    checking = BankAccount.new(123, '0987', 250.0)
    checking.deposit(100.0)

    expect(checking.balance).to eq 350.0
  end

  it 'can withdraw money' do
    checking = BankAccount.new(123, '0987', 250.0)
    checking.withdraw(55.0)

    expect(checking.balance).to eq 195.0
  end

  it 'cannot overdraw account single' do
    checking = BankAccount.new(123, '0987', 250.0)
    checking.withdraw(255.0)

    expect(checking.balance).to eq 250.0
  end

  it 'cannot overdraw account multiple' do
    checking = BankAccount.new(123, '0987', 250.0)
    checking.withdraw(100.0)
    checking.withdraw(100.0)
    checking.withdraw(100.0)

    expect(checking.balance).to eq 50.0
  end

  it 'can verify account details true' do
    checking = BankAccount.new(123, '0987', 250.0)
    id = 123; pin = '0987'

    expect(checking.verify?(id, pin)).to eq true
  end

  it 'can verify account details false' do
    checking = BankAccount.new(123, '0987', 250.0)
    id = 567; pin = '1234'

    expect(checking.verify?(id, pin)).to eq false
  end
end
