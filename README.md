# Swag Panda

Swag Panda is a learning resource for creating an ERC721 NFT with a Landing Page you can mint from.
Created by [@andyhartnett12](https://twitter.com/AndyHartnett12) 

## Getting Started

### Create Secrets File, Update With Your Own Info
```shell
cp secrets-example.json secrets.json
```

### Nuxt Page
```shell
npm install
npm run dev
```

### Local Contract Testing
```shell
npx hardhat compile
npx hardhat node
npx hardhat run scripts/deploy.js --network localhost
```

### Contract Issues?
```shell
npx hardhat clean
```
