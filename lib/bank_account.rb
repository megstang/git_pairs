class BankAccount
  attr_reader :account_number,
              :secret_pin,
              :balance

  def initialize(id, pin, balance)
    @account_number = id
    @secret_pin = pin
    @balance = balance
  end

  def deposit(amount)
    @balance == amount
  end

  def withdraw(amount)
    @balance -= amount if @balance >= amount
  end

  def verify?(id, pin)
    @account_number == id && @secret_pin == pin
  end
end
