<template>
  <v-card
    :loading="loading"
    class="mx-auto my-12"
    max-width="700"
    max-height="10000"
  >
    <v-img height="80" src="@/assets/qnawrite.png"></v-img>

    <v-card-text>
      <v-row>
        <v-col>
          <div class="black--text">
            <v-text-field
              id="comment"
              placeholder="답변 입력"
              v-model="comment.ccontent"
              rows="2"
            ></v-text-field>
          </div>
        </v-col>
      </v-row>
    </v-card-text>

    <v-card-text class="d-flex justify-space-around mb-6">
      <v-btn class="writeFormBtn submit" @click="registComment">등록하기</v-btn>
    </v-card-text>
  </v-card>
</template>

<script>
import http from "@/util/http-common.js";
export default {
  data() {
    return {
      bno: 0,
      comment: {},
    };
  },
  created() {
    this.bno = this.$route.params.bno;
    console.log(this.bno);
  },
  methods: {
    registComment() {
      console.log(this.bno);
      http
        .post("/comment/", {
          bno: this.bno,
          ccontent: this.comment.ccontent,
          comment_no: 0,
          cwrite_date: "string",
          user_name: "ssafy",
        })
        .then((resp) => {
          console.log(resp);
          alert("답변이 등록되었습니다");
        });
      this.moveList();
    },
    moveList() {
      this.$router.push({ path: "/qna/detail/" + this.bno });
    },
  },
};
</script>

<style></style>
