<template>
  <div>
    <h1>게시글 삭제</h1>
    <div>삭제중...</div>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
export default {
  created() {
    let bno = this.$route.params.bno;
    console.log(bno);
    http.delete("/board/" + bno).then((resp) => {
      console.log(resp);
      alert("삭제가 완료되었습니다.");

      this.$router.push({ path: "/qna/list" });
    });
  },
};
</script>

<style></style>
