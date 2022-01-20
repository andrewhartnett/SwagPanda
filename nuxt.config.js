export default {
  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: false,

  // Target: https://go.nuxtjs.dev/config-target
  target: 'static',

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'Swag Panda',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {
        hid: 'description',
        name: 'description',
        content:
          'SwagPanda NFT. Swag Panda is an NFT collection that was built and opensourced for the purpose of learning ERC721 and NFTs in general.'
      },
      { name: 'format-detection', content: 'telephone=no' },
      { name: 'twitter:card', content: 'summary' },
      { name: 'twitter:url', content: 'https://swagpanda.xyz' },
      { name: 'twitter:title', content: 'SwagPanda' },
      {
        name: 'twitter:description',
        content:
          'SwagPanda NFT. Swag Panda is an NFT collection that was built and opensourced for the purpose of learning ERC721 and NFTs in general.'
      },
      {
        name: 'twitter:image',
        content: 'https://swagpanda.xyz/SwagPandaLogo.png'
      },
      { name: 'og:title', content: 'Swag Panda' },
      { name: 'og:type', content: 'website' },
      { name: 'og:url', content: 'https://swagpanda.xyz' },
      { name: 'og:image', content: 'https://swagpanda.xyz/SwagPandaLogo.png' }
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/eslint
    '@nuxtjs/eslint-module',
    // https://go.nuxtjs.dev/tailwindcss
    '@nuxtjs/tailwindcss'
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [],

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {}
}
