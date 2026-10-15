class BankAccount {
  // TODO
  final int accountId;
  final String accountOwner;
  double _balance = 0;

  BankAccount(this.accountId, this.accountOwner);

  double get balance {
    return _balance;
  }

  void withdraw(double amount) {
    if (amount > balance) {
      throw Exception("Not enought money");
    }

    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  // TODO
  final String name;
  final List<BankAccount> _accounts = [];

  Bank(this.name);

  BankAccount createAccount(int accountId, String accountOwner) {
    bool accountExit = _accounts.any(
      (account) => account.accountId == accountId,
    );

    if (accountExit) {
      throw Exception("This accountId already exit");
    }

    BankAccount newAccount = BankAccount(accountId, accountOwner);

    _accounts.add(newAccount);

    return newAccount;
  }
}

void main() {
  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
