import nbaDrafting from 0x05

transaction(name: String, age: UInt ,college: String) {

  prepare(acct: AuthAccount) {
    log(acct.address)
  }

  execute {
    nbaDrafting.addPlayer(name: name, age: age, college: college);
    log("playeradded successfully");
  }
}
