<template>
    <div class="mt-20">
        <button class="bg-purple-700 text-white p-3 mx-2" @click.prevent="mint">Mint!</button>
        <button class="bg-purple-700 text-white p-3 mx-2" @click.prevent="getPandas">Get pandas!</button>
        

        <div v-if="admin" class="mt-6">
            <input v-model="mintAddress" type="text" class="p-3" placeholder="Wallet Address">
            <button :disabled="minting" class="bg-gray-700 text-white p-3" @click.prevent="mintTo">Mint To Address</button>
        </div>

        <div v-if="minting" class="flex mt-12">
            <loading-wheel />

            <div class="pt-4">
                Minting In Progress
            </div>
        </div>

        <div v-if="pandas.length" class="mt-24 flex">
            <div v-for="panda in pandas" :key="panda.name">
                <img :src="panda.image" :alt="panda.name" width="350px">
                <p class="text-center">{{panda.name}}</p>
            </div>
        </div>
    </div>
</template>

<script>
/* eslint-disable no-unused-vars */
import { ethers } from 'ethers'
import axios from 'axios'
import SwagPanda from '../artifacts/contracts/SwagPanda.sol/SwagPanda.json'
const SwagPandaAddress = '0x5FbDB2315678afecb367f032d93F642f64180aa3'

export default {

    data() {
        return {
            pandas: [],
            admin: false,
            mintAddress: '',
            minting: false
        }
    },
    mounted() {
        this.isOwner()
    },
    methods: {
        async mint() {
            if (typeof window.ethereum !== 'undefined') {
                // const [account] = await this.requestAccount()
                const provider = new ethers.providers.Web3Provider(window.ethereum);
                const signer = provider.getSigner()
                const contract = new ethers.Contract(SwagPandaAddress, SwagPanda.abi, signer)
                
                // console.log(account)
                this.minting = true
                await contract.claim()
                this.minting = false
            }
        },
        async mintTo() {
            if (typeof window.ethereum !== 'undefined') {
                // const [account] = await this.requestAccount()
                const provider = new ethers.providers.Web3Provider(window.ethereum);
                const signer = provider.getSigner()
                const contract = new ethers.Contract(SwagPandaAddress, SwagPanda.abi, signer)
                let address = ''
                try{
                    address = ethers.utils.getAddress(this.mintAddress)
                }catch(err) {
                    
                    if(confirm('Would you like to mint a token to the owner?')){
                        address = await contract.owner()
                    }
                }

                if(address) {
                    this.minting = true
                    await contract.ownerClaim(address)
                    this.minting = false
                }
                // console.log(account)
                // await contract.ownerClaim()
            }
        },
        async getPandas() {
            if (typeof window.ethereum !== 'undefined') {
                const [account] = await this.requestAccount()
                const provider = new ethers.providers.Web3Provider(window.ethereum)
                const contract = new ethers.Contract(SwagPandaAddress, SwagPanda.abi, provider)

                const balance = await contract.balanceOf(account)

                const total = parseInt(balance.toString())

                console.log('balance', total)

                const myPandas = []

                for (let i = 0; i < total; i++) {
                    const token = await contract.tokenOfOwnerByIndex(account, i)

                    const tokenUri = await contract.tokenURI(token)

                    const result = await axios.get(tokenUri)

                    myPandas.push(result.data)

                }

                this.pandas = myPandas

                // setPandas(myPandas)
            }
        },
        async  requestAccount() {
            return await window.ethereum.request({ method: 'eth_requestAccounts' });
        },
        async isOwner() {
            const [account] = await this.requestAccount()
            const provider = new ethers.providers.Web3Provider(window.ethereum)
            const signer = provider.getSigner()
            const contract = new ethers.Contract(SwagPandaAddress, SwagPanda.abi, signer)

            const thisAccount = ethers.utils.getAddress(account)
            const owner = await contract.owner()

            this.admin = thisAccount === owner
        }
    }

}
</script>
