<h1>ERC721AGasFeesAutoYield</h1>

I've simply built an extenson to ERC721A, where it is a fully compliant implementation of IERC721 with significant gas savings for minting multiple NFTs in a single transaction. ERC721AGasFeesAutoYield is an ERC721A extension further enabling the smart contract to collect gas fees from transactions and includes Blast's native automatic yield by default.

One important point is that custom logic can be added to gas consumption of the functions, therefore some functions can consume more gas such as while selling a NFT to Marketplace offers and it brings more revenue to the smart contract itself.

This repository also includes a example integration of ERC721AGasFeesAutoYield.
