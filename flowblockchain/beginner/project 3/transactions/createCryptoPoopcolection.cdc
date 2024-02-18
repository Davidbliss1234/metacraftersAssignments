import NonFungibleToken from 0x05;
import CryptoPoops from 0x06;

transaction () {

    prepare(acct: AuthAccount) {
        let collection <- CryptoPoops.createEmptyCollection()

        acct.save(<- collection, to: /storage/CryptoPoops)

        acct.link<&CryptoPoops.Collection{NonFungibleToken.Receiver,NonFungibleToken.CollectionPublic,CryptoPoops.MetaData}>(/public/CryptoPoops, target: /storage/CryptoPoops)
    }

    execute{
        log("created collecion successfully, and linked colection to the public");
        }
    }
