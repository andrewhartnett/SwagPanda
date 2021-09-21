<template>
    <div class="sm:flex sm:w-2/3 sm:mx-auto">
      <div v-for="panda in pandas" :key="panda.name">
        <img :src="panda.image" :alt="panda.name">
        <p class="text-center">{{panda.name}}</p>
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