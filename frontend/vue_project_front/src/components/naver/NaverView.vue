<template>
  <div>
    <v-container>
      <v-row>
        <v-col cols="8"
          ><v-card elevation="5" class="rounded-xl my-16">
            <v-simple-table dark class="pt-3 pb-7 mb-10 rounded-xl">
              <template v-slot:default>
                <thead>
                  <tr>
                    <!-- <th class="text-left" width="7%">글번호</th> -->
                    <th class="text-center" width="33%">제목</th>
                    <th class="text-center" width="40%">내용</th>
                    <th class="text-center" width="7%">링크</th>
                    <th class="text-center" width="13%">게재일시</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(news, index) in newsList" :key="index">
                    <!-- <td>{{ index }}</td> -->
                    <td class="font-weight-bold" v-html="news.title"></td>
                    <td class="descrip pa-2" v-html="news.description"></td>
                    <td class="text-center">
                      <a class="alink" :href="news.link"
                        ><v-icon>mdi-link-variant</v-icon></a
                      >
                    </td>
                    <td class="text-center">{{ news.pubDate | dateFormat }}</td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>
          </v-card>
        </v-col>
        <v-col class="d-flex align-center justify-center mb-6">
          <h1>
            <v-row class="d-flex justify-center"> 실시간 </v-row>
            <v-row> 부동산 뉴스 🧐 </v-row>
          </h1></v-col
        >
      </v-row>
    </v-container>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
export default {
  data() {
    return {
      newsList: [],
    };
  },
  created() {
    http.get("/naver/news?keyword=" + "부동산").then(({ data }) => {
      console.log(data);
      this.newsList = data.items;
      console.log(this.newsList);
    });
  },
  filters: {
    dateFormat(value) {
      return value.substring(16, 22) + " " + value.substring(0, 11);
    },
  },
};
</script>

<style>
a:link {
  text-decoration: none;
  color: #f0f0f0;
}

.alink:link {
  text-decoration: none;
  color: #f0f0f0;
}
.alink:visited {
  color: #616161;
  text-decoration: none;
}
.descrip {
  color: #cfd8dc;
}
</style>
