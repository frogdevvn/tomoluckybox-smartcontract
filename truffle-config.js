"use strict";
var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic =
  "federal dolphin like mansion defy hold follow spider never scene wise shaft";
module.exports = {
  networks: {
    development: {
      provider: () => new HDWalletProvider(mnemonic, "http://127.0.0.1:8545"),
      host: "127.0.0.1",
      port: "8545",
      network_id: "*" // Match any network id
    },
    tomotestnet: {
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          "https://testnet.tomochain.com",
          0,
          1,
          true,
          "m/44'/889'/0'/0/"
        ),
      network_id: "89",
      gas: 2000000,
      gasPrice: 10000000000000
    },
    tomomainnet: {
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          "https://rpc.tomochain.com",
          0,
          1,
          true,
          "m/44'/889'/0'/0/"
        ),
      network_id: "88",
      gas: 5000000,
      gasPrice: 10000000000000
    }
  },
  compilers: {
    solc: {
      settings: {
        evmVersion: "byzantium"
      }
    }
  }
};
