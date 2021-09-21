<template>
    <div class="mt-20">
        <button class="bg-purple-700 text-white p-3 mx-2" @click.prevent="mint">Mint!</button>
        <button class="bg-purple-700 text-white p-3" @click.prevent="getPandas">Get pandas!</button>

        <div v-if="pandas.length" class="mt-24 flex">
            <div v-for="panda in pandas" :key="panda.name">
                <img :src="panda.image" :alt="panda.name" width="350px">
                <p class="text-center">{{panda.name}}</p>
            </div>
        </div>
    </div>
</template>

<script>
import { ethers } from 'ethers'
import axios from 'axios'
import SwagPanda from '../artifacts/contracts/SwagPanda.sol/SwagPanda.json'
const SwagPandaAddress = '0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9'

export default {

    data() {
        return {
            pandas: [],
            
        }
    },
    methods: {
        async mint() {
            if (typeof window.ethereum !== 'undefined') {
                // const [account] = await this.requestAccount()
                const provider = new ethers.providers.Web3Provider(window.ethereum);
                const signer = provider.getSigner()
                const contract = new ethers.Contract(SwagPandaAddress, SwagPanda.abi, signer)
                
                // console.log(account)
                await contract.ownerClaim()
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
        }
    }

}
</script>
