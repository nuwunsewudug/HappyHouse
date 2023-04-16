const { defineConfig } = require("@vue/cli-service");
module.exports = defineConfig({
  transpileDependencies: ["vuetify"],
  chainWebpack: (config) => {
    config.plugins.delete("prefetch"); // prefetch 삭제
    // prefetch 기능을 삭제해도 Lazy Load 사용 가능
    // 컴포넌트 import 시 아래와 같이 처리
    // import(/* webpackPrefetch: true */ './views/XXX.vue');
  },
  devServer: {
    proxy: {
      "/oauth2.0": {
        target: "https://nid.naver.com/",
      },
    },
  },
});
