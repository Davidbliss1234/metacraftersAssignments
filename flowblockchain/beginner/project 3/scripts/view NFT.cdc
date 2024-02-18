import NonFungibleToken from 0x05;
import CryptoPoops from 0x06;

pub fun main(owner: Address, id: UInt64) {
  let collection = getAccount(owner).getCapability<&CryptoPoops.Collection{CryptoPoops.MetaData}>(/public/CryptoPoops).borrow()
                ?? panic("the recipient doesn't have a cryptoPoops colection")

      let nft = collection.borrowAuthNFT(id:id)

      log(nft.name)
      log(nft.luckyNumber)
      log(nft.favouriteFood)
}
