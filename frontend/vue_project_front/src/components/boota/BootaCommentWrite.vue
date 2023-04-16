<template>
  <v-container class="d-flex justify-center">
    <v-card class="mb-16" max-width="800px">
      <v-card-title>
        <v-img height="80" src="@/assets/bootawrite.png"></v-img>
        <span class="text-h5 font-weight-bold mb-10">댓글 작성</span>
      </v-card-title>
      <v-card-text>
        <v-row>
          <v-col rows="3" cols="12" md="6">
            <v-text-field
              id="comment"
              placeholder="댓글 입력"
              v-model="ccontent"
              rows="2"
            ></v-text-field>
          </v-col>
        </v-row>

        <small>*악플 및 비방은 금지.</small>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="blue darken-1" text @click="registComment">
          등록하기
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-container>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  data() {
    return {
      btbno: 0,
      ccontent: "",
    };
  },
  created() {
    this.btbno = this.$route.params.btbno;
    console.log(this.bno);
  },
  methods: {
    registComment() {
      console.log(this.bno);
      http
        .post("boota/comment/", {
          btbno: this.btbno,
          ccontent: this.ccontent,
        })
        .then((resp) => {
          console.log(resp);
          alert("답변이 등록되었습니다");
        });
      this.moveList();
    },
    moveList() {
      this.$router.push({ path: "/boota/detail/" + this.btbno });
    },
  },
};
</script>

<style></style>
