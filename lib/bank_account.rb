class BankAccount
  attr_reader :account_number, :secret_pin, :balance

  def initialize(account_number, secret_pin, balance)
    @account_number = account_number
    @secret_pin = secret_pin
    @balance = balance
  end

  def deposit(amount)
    @balance == amount
  end

  def withdraw(amount)
    if @balance >= amount
      @balance -= amount
    end
    @balance >= amount
  end

  def verify?(id, code)
    return true if id == code
  end
end
