<template>
  <div>
    <div class="prose md:prose-xl text-center mx-auto mt-20">
      <h1>
        Swag Panda
      </h1>
      <p>
        This project was created for the purpose of learning and having fun.
        These tokens may have utility in the future, but for now, they are just Swag Pandas you can use however you like.
      </p>
        
      <p>
        Have fun, play at your own risk, not financial advice, etc.
      </p>
      
    </div>
    <div class="text-center mx-auto mt-16">
      <div class="text-lg my-4 font-bold">Cost to mint is TBD</div>
      <!-- <nuxt-link to="/mint" class="bg-purple-900 text-white py-4 px-8 hover:bg-purple-600 inline-block disabled">MINT</nuxt-link> -->
      <button disabled class="bg-purple-900 text-white py-4 px-8 hover:bg-purple-600 inline-block disabled">MINT COMING SOON</button>
    </div>
    <div class="sm:flex sm:w-2/3 sm:mx-auto">
      <div v-for="panda in pandas" :key="panda.name">
        <img :src="panda.image" :alt="panda.name">
        <p class="text-center">{{panda.name}}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      pandas: []
    }
  },
  mounted() {
    const rand1 = Math.floor(Math.random() * 100);
    const rand2 = Math.floor(Math.random() * 100);
    const rand3 = Math.floor(Math.random() * 100);

    this.pandas = [
      {
        name: `SwagPanda #${rand1}`,
        image: `https://swagpanda.s3.amazonaws.com/img/${rand1}.svg`,
      },
      {
        name: `SwagPanda #${rand2}`,
        image: `https://swagpanda.s3.amazonaws.com/img/${rand2}.svg`,
      },
      {
        name: `SwagPanda #${rand3}`,
        image: `https://swagpanda.s3.amazonaws.com/img/${rand3}.svg`,
      },
    ]
  }
}
</script>
