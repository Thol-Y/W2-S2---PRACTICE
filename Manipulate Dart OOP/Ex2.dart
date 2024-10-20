//Bank Account
class BankAccount{
  final int _accId;
  final String _accOwner;
  double _balance = 0.0;
  bool _isActive = true;

  BankAccount(this._accId, this._accOwner);

  double get balance => _balance;

  //withdraw an amount
  void withdraw(double amount){
    if(!_isActive){
      print('Account is inactive');
      return;
    }
    if(amount <= 0){
      print('Invalid amount');
      return;
    }
    if(amount > _balance){
      print('Insufficient balance');
      return;
    }
    _balance -= amount;
  }

  //credit an amount
  void credit(double amount){
    if(!_isActive){
      print('Account is inactive');
      return;
    }
    if(amount <= 0){
      print('Invalid amount');
      return;
    }
    _balance += amount;
  }

  @override
  String toString(){
    return 'Bank Account:\n'
    'Account ID: $_accId\n'
    'Account Owner: $_accOwner\n'
    'Balance: \$$_balance\n'
    'Account Status: ${_isActive?'Active':'Inactive'}';
  }
}

//Bank
class Bank{
  final String name;
  final List<BankAccount> _accounts = [];

  Bank(this.name);

  //create a new account
  BankAccount createAccount(int accId, String accOwner){
    for(var account in _accounts){
      if(account._accId == accId){
        print('Account ID already exists');
        return account;
      }
    }
    //create a new account
    BankAccount newAccount = BankAccount(accId, accOwner);
    _accounts.add(newAccount);
    return newAccount;
  }

  @override
  String toString(){
    return 'Bank: $name\n'
    'Accounts: ${_accounts.length}';
  }
}

void main(){
  Bank bank = Bank('ABA Bank');
  BankAccount acc1 = bank.createAccount(001, 'Sithol Pen');
  BankAccount acc2 = bank.createAccount(002, 'Elon Mask');

  acc1.credit(1000);
  print('Account 1 balance: ${acc1.balance}');
  acc1.withdraw(500);
  print('Account 1 balance: ${acc1.balance}');
  print(bank);
  print(acc1);
  print(acc2);
  print('Accounts created: ${bank._accounts.length}');
}
