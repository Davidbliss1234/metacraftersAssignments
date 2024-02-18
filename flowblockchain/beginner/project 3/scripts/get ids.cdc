import NonFungibleToken from 0x05;
import CryptoPoops from 0x06;

pub fun main(owner: Address) {
  let collection = getAccount(owner).getCapability<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>(/public/CryptoPoops).borrow()
                ?? panic("the recipient doesn't have a cryptoPoops colection")

      log(collection.getIDs())
}

