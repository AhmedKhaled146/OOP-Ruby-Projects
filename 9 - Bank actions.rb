# Write a Ruby program to create a class called "Bank" with a collection of accounts and methods to add and remove accounts,
# and to deposit and withdraw money. Also define a class called "Account" to maintain account details of a particular customer.



class Bank
  def initialize
    @accounts = []
  end
  def add_account(account)
    find_account = @accounts.find {|account_by_id| account_by_id.account_id == account.account_id}
    if find_account
      puts "This account is exist."
    else
      @accounts << account
      puts "#{account.account_name} account was added to CIB Bank."
    end
  end

  def remove_account(account_id)
    account_remove = @accounts.find {|account| account.account_id == account_id}
    if account_remove
      @accounts.delete(account_remove)
      puts "#{account_remove.account_id} has removed"
    else
      puts "This account is not found."
    end
  end

  def show_all_accounts_by_name
    puts "All accounts in the bank: "
    @accounts.each { |account| puts "- #{account.account_name}" }
  end

  def deposit(account, value)
    find_account = @accounts.find {|account_by_id| account_by_id.account_id == account.account_id}
    if find_account
      if value > 0
        account.balance += value
        puts "#{account.account_name} You deposit #{value} pounds to your bank account."
        puts "Your Bank Balance is #{account.balance}"
      else
        puts "You should enter a valid value to add to balance."
      end
    else
      puts "account not found."
    end
  end

  def withdraw(account, value)
    find_account = @accounts.find {|account_by_id| account_by_id.account_id == account.account_id}
    if find_account
      if account.balance > 0
        if value == account.balance
          puts "Your Total Account Balance is eqal the value you need. your balance become 0."
          account.balance -= value
          puts "Your account balance is #{account.balance}"
        elsif value > account.balance
          puts "your value you need is more than you balance. Enter a small value"
          puts "Your account balance is #{account.balance}"
        elsif value > 0
          account.balance -= value
          puts "#{account.account_name} You withdrew #{value} pounds from your bank account."
          puts "Your Bank Balance is #{account.balance}"
        else
          puts "You should enter a valid value to add to balance."
        end
      else
        puts "Your balance is equal Zero."
      end
    else
      puts "account not found."
    end
  end

end

class Account
  attr_accessor :account_id, :account_name, :balance

  def initialize(account_id, account_name)
    @account_id = account_id
    @account_name = account_name
    @balance = 0
  end

end

cib = Bank.new

ahmed_account = Account.new(1412, "ahmed")
hema_account = Account.new(1413, "hema")
khaled_account = Account.new(1412, "khaled")

cib.add_account(ahmed_account)
cib.add_account(hema_account)
cib.add_account(khaled_account) # this adding give an error because the account_id is exist.
puts "--" * 50
cib.deposit(ahmed_account, 2000)
puts "--" * 50
cib.deposit(hema_account, 2000)
puts "--" * 50
cib.withdraw(hema_account, -200) # negative number
cib.withdraw(hema_account, 0) # Equal Zero
cib.withdraw(hema_account, 2000) # Equal the real balance
cib.withdraw(hema_account, 2500) # More than the Real Balance
cib.withdraw(hema_account, 200) # default value
puts "--" * 50
cib.show_all_accounts_by_name # Show all accounts in the Bank by Name

