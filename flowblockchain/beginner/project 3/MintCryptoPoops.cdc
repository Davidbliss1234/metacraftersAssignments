import NonFungibleToken from 0x05;
import CryptoPoops from 0x06;


transaction(_name: String, _favouriteFood: String, _luckyNumber: Int, _recipient: Address) {

  prepare(acct: AuthAccount) {
   let minter = acct.borrow<&CryptoPoops.Minter>(from: /storage/Minter)
            ?? panic("you are not allowed to create cryptoPoops")

    let cryptoPoop <- minter.createNFT(name: _name, favouriteFood: _favouriteFood, luckyNumber: _luckyNumber)

    let collection = getAccount(_recipient).getCapability<&CryptoPoops.Collection{NonFungibleToken.Receiver}>(/public/CryptoPoops).borrow()
                ?? panic("the recipient doesn't have a cryptoPoops colection")

    collection.deposit(token: <- cryptoPoop)


  }

  execute {
      log("cryptoPoop added successfully");
  }
}
